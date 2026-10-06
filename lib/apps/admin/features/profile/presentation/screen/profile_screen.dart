import 'dart:io';

import 'package:doctor_hunt/apps/admin/features/profile/presentation/cubit/adminprofile_cubit.dart';
import 'package:doctor_hunt/apps/admin/features/profile/presentation/cubit/adminprofile_state.dart';
import 'package:doctor_hunt/apps/admin/features/profile/presentation/widgets/admin_profile_fields.dart';
import 'package:doctor_hunt/apps/admin/features/profile/presentation/widgets/admin_profile_image.dart';
import 'package:doctor_hunt/apps/admin/features/profile/presentation/widgets/admin_profile_save_button.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';

import 'package:doctor_hunt/apps/core/widget/header_widget.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  File? _selectedImageFile;
  String? _selectedImageExtension;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      _selectedImageFile = File(image.path);
      _selectedImageExtension = _getExtension(image.name);
    });
  }

  String _getExtension(String fileName) {
    final parts = fileName.split('.');

    if (parts.length < 2) {
      return 'jpg';
    }

    return parts.last.toLowerCase();
  }

  void _fillControllers(AdminProfileState state) {
    final profile = state.profile;

    if (profile == null) return;

    if (_fullNameController.text.isEmpty) {
      _fullNameController.text = profile.fullName;
    }

    if (_emailController.text.isEmpty) {
      _emailController.text = profile.email;
    }

    if (_locationController.text.isEmpty) {
      _locationController.text = profile.clinicLocation;
    }
  }

  void _saveChanges() {
    FocusScope.of(context).unfocus();

    context.read<AdminProfileCubit>().updateProfile(
      fullName: _fullNameController.text.trim(),
      clinicLocation: _locationController.text.trim(),
      imageFile: _selectedImageFile,
      extension: _selectedImageExtension,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocConsumer<AdminProfileCubit, AdminProfileState>(
      listener: (context, state) {
        if (state.status == AdminProfileStatus.success) {
          _fillControllers(state);

          if (_selectedImageFile != null) {
            setState(() {
              _selectedImageFile = null;
              _selectedImageExtension = null;
            });
          }
        }

        if (state.status == AdminProfileStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Something went wrong'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == AdminProfileStatus.loading &&
            state.profile == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        _fillControllers(state);

        return Scaffold(
          backgroundColor: const Color(0xffF1F5F9),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w(8)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderAppBar(
                      title: t.adminprofile,
                      actionIcon: Icons.arrow_back_ios,
                      onBackPressed: () {
                        context.pop();
                      },
                    ),

                    SizedBox(height: context.h(24)),

                    AdminProfileImage(
                      profile: state.profile,
                      selectedImageFile: _selectedImageFile,
                      onTap: state.status == AdminProfileStatus.saving
                          ? null
                          : _pickImage,
                      tapPhotoText: t.tapphoto,
                    ),

                    SizedBox(height: context.h(24)),

                    AdminProfileFields(
                      fullNameController: _fullNameController,
                      emailController: _emailController,
                      locationController: _locationController,
                      fullNameHint: t.enterfullname,
                      emailHint: t.adminhintemail,
                      locationHint: t.doctorhunthq,
                    ),

                    SizedBox(height: context.h(24)),

                    AdminProfileSaveButton(
                      isSaving: state.status == AdminProfileStatus.saving,
                      label: t.savechange,
                      onPressed: _saveChanges,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
