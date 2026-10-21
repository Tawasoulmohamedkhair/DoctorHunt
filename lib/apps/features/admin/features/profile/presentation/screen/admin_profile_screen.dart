import 'dart:io';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';

import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/widget/header_appbar.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/cubit/adminprofile_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/cubit/adminprofile_state.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/widgets/admin_profile_fields.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/widgets/admin_profile_image.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/widgets/admin_profile_save_button.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/screen/clinic_location_picker_screen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();

  late final ImagePicker _imagePicker;
  final Geocoding _geocoding = Geocoding();

  bool _controllersInitialized = false;
  bool _isOpeningLocationPicker = false;
  bool _isLoadingAddress = false;

  File? _selectedImageFile;
  String? _selectedImageExtension;

  double? _selectedLatitude;
  double? _selectedLongitude;

  bool get _isCubitSaving =>
      context.read<AdminProfileCubit>().state.status ==
      AdminProfileStatus.saving;

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _fillControllers(context.read<AdminProfileCubit>().state);
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _fillControllers(AdminProfileState state) {
    final profile = state.profile;

    if (profile == null || _controllersInitialized) return;

    _fullNameController.text = profile.fullName;
    _emailController.text = profile.email;
    _locationController.text = profile.clinicLocation;

    _selectedLatitude = profile.latitude;
    _selectedLongitude = profile.longitude;

    _controllersInitialized = true;
  }

  Future<void> _pickImage() async {
    if (_isCubitSaving) return;

    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (!mounted || image == null) return;

      setState(() {
        _selectedImageFile = File(image.path);
        _selectedImageExtension = _getExtension(image.name);
      });
    } catch (e, stackTrace) {
      debugPrint('Failed to pick profile image: $e');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      _showMessage(t.unableToSelectImage);
    }
  }

  String _getExtension(String fileName) {
    final parts = fileName.split('.');

    if (parts.length < 2 || parts.last.isEmpty) {
      return 'jpg';
    }

    return parts.last.toLowerCase();
  }

  Future<void> _pickClinicLocation() async {
    if (_isOpeningLocationPicker || _isLoadingAddress || _isCubitSaving) {
      return;
    }

    _isOpeningLocationPicker = true;

    try {
      final result = await Navigator.of(context).push<LatLng>(
        MaterialPageRoute<LatLng>(
          builder: (_) => ClinicLocationPickerScreen(
            initialLatitude: _selectedLatitude,
            initialLongitude: _selectedLongitude,
          ),
        ),
      );

      if (!mounted || result == null) return;

      setState(() {
        _selectedLatitude = result.latitude;
        _selectedLongitude = result.longitude;
        _isLoadingAddress = true;
      });

      await _loadLocationAddress(result);
    } catch (e, stackTrace) {
      debugPrint('Failed to select clinic location: $e');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      _showMessage(t.unableToChooseClinicLocation);
    } finally {
      _isOpeningLocationPicker = false;
    }
  }

  Future<void> _loadLocationAddress(LatLng location) async {
    try {
      final placemarks = await _geocoding.placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (!mounted) return;

      if (placemarks.isEmpty) {
        _showAddressError();
        return;
      }

      final place = placemarks.first;

      final addressParts =
          [
                place.name,
                place.subLocality,
                place.locality,
                place.subAdministrativeArea,
                place.administrativeArea,
                place.country,
              ]
              .whereType<String>()
              .map((value) => value.trim())
              .where((value) => value.isNotEmpty)
              .toSet()
              .toList();

      if (addressParts.isEmpty) {
        _showAddressError();
        return;
      }

      setState(() {
        _locationController.text = addressParts.join(', ');
      });
    } catch (e, stackTrace) {
      debugPrint('Failed to get clinic address: $e');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      _showAddressError();
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingAddress = false;
        });
      }
    }
  }

  void _showAddressError() {
    _showMessage(
      t.addressCouldNotBeRetrieved,
    );
  }

  void _showMessage(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _saveChanges() {
    if (_isCubitSaving) return;

    FocusScope.of(context).unfocus();

    if (_isLoadingAddress) {
      _showMessage(t.pleaseWaitForAddress);
      return;
    }

    final fullName = _fullNameController.text.trim();
    final location = _locationController.text.trim();

    if (fullName.isEmpty) {
      _showMessage(t.enterYourFullName);
      return;
    }

    if (location.isEmpty) {
      _showMessage(t.selectClinicLocation);
      return;
    }

    if (_selectedLatitude == null || _selectedLongitude == null) {
      _showMessage(t.selectLocationCoordinates);
      return;
    }

    context.read<AdminProfileCubit>().updateProfile(
      fullName: fullName,
      clinicLocation: location,
      latitude: _selectedLatitude,
      longitude: _selectedLongitude,
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
        }

        if (state.status == AdminProfileStatus.saved) {
          context.pop(true);
        }

        if (state.status == AdminProfileStatus.failure) {
          _showMessage(state.errorMessage ?? t.error);
        }
      },
      builder: (context, state) {
        if (state.status == AdminProfileStatus.loading &&
            state.profile == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final isSaving = state.status == AdminProfileStatus.saving;
        final isBusy = isSaving || _isLoadingAddress;

        return Scaffold(
          backgroundColor: AppColors.surfaceSlate,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w(8)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderAppBar(
                      title: t.adminprofile,
                      onBackPressed: () => context.pop(),
                    ),
                    SizedBox(height: context.h(24)),
                    AdminProfileImage(
                      profile: state.profile,
                      selectedImageFile: _selectedImageFile,
                      onTap: isBusy ? null : _pickImage,
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
                      locationReadOnly: isBusy,
                      onLocationTap: isBusy || _isOpeningLocationPicker
                          ? null
                          : _pickClinicLocation,
                    ),

                    SizedBox(height: context.h(24)),
                    AdminProfileSaveButton(
                      isSaving: isBusy,
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

