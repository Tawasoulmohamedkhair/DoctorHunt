import 'dart:io';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/helper/image_picker_helper.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_app_text_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_outlined_action_button.dart';
import 'package:doctor_hunt/apps/core/widgets/header_appbar.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/doctorform_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/cubit/doctorform_state.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_form_field_label.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_image_picker.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctor_status_card.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/doctors_error_state.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/specialty_dropdown.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorFormScreen extends StatefulWidget {
  const DoctorFormScreen({super.key, this.doctorId});

  final String? doctorId;

  @override
  State<DoctorFormScreen> createState() => _DoctorFormScreenState();
}

class _DoctorFormScreenState extends State<DoctorFormScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _feeController;

  bool _controllersInitialized = false;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _feeController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _feeController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final image = await ImagePickerHelper.pickFromGallery();

      if (image == null || !mounted) return;

      final extension = image.name.contains('.')
          ? image.name.split('.').last.toLowerCase()
          : 'jpg';

      context.read<DoctorFormCubit>().setImage(
        file: File(image.path),
        extension: extension,
      );
    } catch (error) {

      if (mounted) {
        _showMessage(t.unableToSelectImage);
      }
    }
  }

  void _saveDoctor() {
    final cubit = context.read<DoctorFormCubit>();

    final name = _nameController.text.trim();
    final feeText = _feeController.text.trim();

    if (name.isEmpty) {
      _showMessage(t.pleaseEnterDoctorName);
      return;
    }

    if (feeText.isEmpty) {
      _showMessage(t.pleaseEnterConsultationFee);
      return;
    }

    final cleanedFee = feeText.replaceAll(',', '').replaceAll('\$', '');
    final fee = double.tryParse(cleanedFee);

    if (fee == null || fee < 0) {
      _showMessage(t.pleaseEnterValidConsultationFee);
      return;
    }

    cubit.save(fullName: name, fee: fee);
  }

  void _deleteDoctor() {
    final screenContext = context;
    final cubit = screenContext.read<DoctorFormCubit>();

    _isDeleting = true;

    showDialog<void>(
      context: screenContext,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BlocConsumer<DoctorFormCubit, DoctorFormState>(
          bloc: cubit,
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == DoctorFormStatus.success) {
              _isDeleting = false;
              Navigator.of(dialogContext).pop();
              Navigator.of(screenContext).pop(true);
              return;
            }

            if (state.status == DoctorFormStatus.failure &&
                state.errorMessage != null) {
              _isDeleting = false;
              Navigator.of(dialogContext).pop();
              _showMessage(state.errorMessage!);
            }
          },
          builder: (context, state) {
            final isDeleting = state.status == DoctorFormStatus.deleting;

            return AlertDialog(
              title: Text(t.deleteDoctor),
              content: isDeleting
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12),
                        CircularProgressIndicator(color: AppColors.dangerMuted),
                        SizedBox(height: 16),
                        Text(t.deletingDoctor),
                      ],
                    )
                  : Text(t.confirmDeleteDoctor),
              actions: isDeleting
                  ? null
                  : [
                      TextButton(
                        onPressed: () {
                          _isDeleting = false;
                          Navigator.of(dialogContext).pop();
                        },
                        child: Text(t.cancel),
                      ),
                      TextButton(
                        onPressed: cubit.deleteDoctor,
                        child: Text(
                          t.deleteDoctor,
                          style: context.regular.copyWith(color: AppColors.red),
                        ),
                      ),
                    ],
            );
          },
        );
      },
    ).then((_) {
      _isDeleting = false;
    });
  }

  void _showMessage(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _initializeControllers(DoctorFormState state) {
    if (_controllersInitialized) return;

    _nameController.text = state.doctor?.fullName ?? '';

    _feeController.text = state.doctor != null
        ? state.doctor!.fee.toStringAsFixed(2)
        : '';

    _controllersInitialized = true;
  }

  InputBorder _fieldBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.r(12)),
      borderSide: const BorderSide(color: AppColors.borderMuted),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorFormCubit, DoctorFormState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.doctor != current.doctor,
      listener: (context, state) {
        if (state.status == DoctorFormStatus.ready) {
          _initializeControllers(state);
        }

        if (state.status == DoctorFormStatus.success && !_isDeleting) {
          Navigator.of(context).pop(true);
        }

        if (state.status == DoctorFormStatus.failure &&
            state.errorMessage != null &&
            !_isDeleting) {
          _showMessage(state.errorMessage!);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF3FBF4),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF3FBF4),
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: context.h(56),
          titleSpacing: 0,
          title: BlocBuilder<DoctorFormCubit, DoctorFormState>(
            buildWhen: (previous, current) =>
                previous.doctor != current.doctor ||
                previous.status != current.status,
            builder: (context, state) {
              final isEditMode = state.doctor != null;

              return HeaderAppBar(
                title: isEditMode ? t.editDoctor : t.createDoctor,
                showAction: false,
                titleStyle: context.semiBoldPx20.copyWith(
                  fontSize: context.sp(20),
                  color: AppColors.textDeep,
                ),
                onBackPressed: () => Navigator.of(context).pop(),
              );
            },
          ),
        ),
        body: BlocBuilder<DoctorFormCubit, DoctorFormState>(
          builder: (context, state) {
            if (state.status == DoctorFormStatus.initial ||
                state.status == DoctorFormStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.success),
              );
            }
            if (state.status == DoctorFormStatus.failure &&
                state.doctor == null) {
              return DoctorsErrorState(
                message: state.errorMessage ?? t.error,
                onRetry: () {
                  context.read<DoctorFormCubit>().initialize(
                    doctorId: widget.doctorId,
                  );
                },
              );
            }

            if (state.status == DoctorFormStatus.ready ||
                state.status == DoctorFormStatus.saving ||
                state.status == DoctorFormStatus.deleting ||
                state.status == DoctorFormStatus.failure ||
                state.status == DoctorFormStatus.success) {
              return _buildForm(context, state);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildMedicalServices(
    BuildContext context,
    DoctorFormState state, {
    required bool isBusy,
  }) {
    final cubit = context.read<DoctorFormCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DoctorFormFieldLabel(label: 'MEDICAL SERVICES'),
        SizedBox(height: context.h(8)),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(context.w(12)),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.borderMuted),
            borderRadius: BorderRadius.circular(context.r(12)),
          ),
          child: state.isLoadingMedicalServices
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(color: AppColors.success),
                  ),
                )
              : state.selectedSpecialtyId == null
              ? const Text('Please select a specialty first.')
              : state.medicalServices.isEmpty
              ? const Text('No medical services available for this specialty.')
              : Column(
                  children: state.medicalServices.map((service) {
                    final selected = state.selectedMedicalServiceIds.contains(
                      service.id,
                    );

                    return Material(
                      color: Colors.transparent,

                      child: CheckboxListTile(
                        value: selected,
                        onChanged: isBusy
                            ? null
                            : (_) {
                                cubit.toggleMedicalService(service.id);
                              },
                        title: Text(service.name),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        activeColor: AppColors.success,
                        tileColor: AppColors.white,
                        selectedTileColor: AppColors.white,
                        selected: false,
                      ),
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context, DoctorFormState state) {
    final isEditMode = state.doctor != null;
    final isSaving = state.status == DoctorFormStatus.saving;
    final isDeleting = state.status == DoctorFormStatus.deleting;
    final isBusy = isSaving || isDeleting;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          context.w(20),
          context.h(8),
          context.w(20),
          context.h(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: DoctorImagePicker(
                selectedImageFile: state.selectedImageFile,
                imageUrl: state.doctor?.imageUrl,
                onTap: isBusy ? null : _pickImage,
                isCreateMode: !isEditMode,
              ),
            ),
            SizedBox(height: context.h(28)),
            DoctorFormFieldLabel(label: t.doctorName),
            SizedBox(height: context.h(8)),
            CustomAppTextField(
              controller: _nameController,
              type: AppTextFieldType.text,
              hintText: t.doctorNameExample,
              textAlign: TextAlign.start,
              border: _fieldBorder(context),
            ),
            SizedBox(height: context.h(20)),
            DoctorFormFieldLabel(label: t.specialty.toUpperCase()),
            SizedBox(height: context.h(8)),
            SpecialtyDropdown(
              specialties: state.specialties,
              selectedSpecialtyId: state.selectedSpecialtyId,
              onChanged: (value) {
                if (isBusy) return;
                context.read<DoctorFormCubit>().selectSpecialty(value);
              },
            ),

            SizedBox(height: context.h(20)),
            _buildMedicalServices(context, state, isBusy: isBusy),
            SizedBox(height: context.h(20)),
            DoctorFormFieldLabel(label: t.consultationFee.toUpperCase()),

            SizedBox(height: context.h(8)),
            CustomAppTextField(
              controller: _feeController,
              type: AppTextFieldType.number,
              hintText: t.consultationFeeExample,
              textAlign: TextAlign.start,
              border: _fieldBorder(context),
            ),
            if (isEditMode) ...[
              SizedBox(height: context.h(24)),
              DoctorStatusCard(
                isActive: state.isActive,
                onChanged: isBusy
                    ? (_) {}
                    : context.read<DoctorFormCubit>().setActive,
              ),
            ],
            SizedBox(height: context.h(32)),
            CustomElevatedButton(
              width: double.infinity,
              label: Text(isEditMode ? t.savechange : t.createDoctor),
              onPressed: isBusy ? null : _saveDoctor,
            ),
            if (isEditMode) ...[
              SizedBox(height: context.h(12)),
              SizedBox(
                width: double.infinity,
                height: context.h(52),
                child: CustomOutlinedActionButton(
                  onPressed: isBusy ? null : _deleteDoctor,
                  text: t.deleteDoctor,
                  icon: const Icon(
                    Icons.delete_rounded,
                    color: AppColors.dangerMuted,
                  ),
                ),
              ),
            ],

            SizedBox(height: context.h(12)),
          ],
        ),
      ),
    );
  }
}
