import 'dart:io';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';

import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/core/widgets/app_image.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_app_text_field.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/core/widgets/header_appbar.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authRepository = getIt<AuthRepository>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _avatarUrl;
  File? _selectedImage;

  bool _isLoading = true;
  bool _isSaving = false;
  bool _hasStartedProfileLoad = false;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_hasStartedProfileLoad) return;

    _hasStartedProfileLoad = true;
    final currentUser = context.read<AuthCubit>().state.user;
    if (currentUser != null &&
        currentUser.id == _authRepository.currentUserId) {
      _nameController.text = currentUser.fullName;
      _phoneController.text = currentUser.phone ?? '';
      _avatarUrl = currentUser.avatarUrl;
      _isLoading = false;
      return;
    }

    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    final t = Translations.of(context);
    if (!_authRepository.hasCurrentUser) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
      return;
    }

    try {
      final profile = await _authRepository.getCurrentUserProfile(
        throwIfMissing: true,
      );

      if (!mounted) return;
      if (profile == null) return;

      _nameController.text = profile.fullName;
      _phoneController.text = profile.phone ?? '';
      _avatarUrl = profile.avatarUrl;
    } catch (error) {

      if (mounted) {
        _showMessage(t.unableToLoadProfile);
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _pickImage() async {
    final t = Translations.of(context);
    try {
      final picker = ImagePicker();

      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image == null || !mounted) return;

      setState(() {
        _selectedImage = File(image.path);
      });
    } catch (error) {

      if (mounted) {
        _showMessage(t.unableToSelectImage);
      }
    }
  }

  Future<void> _saveProfile() async {
    final t = Translations.of(context);

    if (!_authRepository.hasCurrentUser) {
      _showMessage(t.pleaseSignInAgain);
      return;
    }

    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isEmpty) {
      _showMessage(t.enterYourFullName);
      return;
    }

    if (phone.isEmpty) {
      _showMessage(t.enterYourPhoneNumber);
      return;
    }

    setState(() => _isSaving = true);

    try {
      final imageUrl = await _authRepository.updateCurrentUserProfile(
        fullName: name,
        phone: phone,
        currentAvatarUrl: _avatarUrl,
        newAvatar: _selectedImage,
      );

      if (!mounted) return;

      context.read<AuthCubit>().updateCurrentUserProfile(
        fullName: name,
        phone: phone,
        avatarUrl: imageUrl,
      );

      _showMessage(t.profileUpdatedSuccessfully);
    
      Navigator.of(context).pop(true);
    } catch (error) {

      if (mounted) {
        _showMessage(
          t.unableToSaveProfile,
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildProfileImage() {
    final imageSize = context.w(130);

    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        children: [
          AppImage(
            key: ValueKey('${_avatarUrl}_${_selectedImage?.path}'),
            imageFile: _selectedImage,
            imageUrl: _avatarUrl,
            width: imageSize,
            height: imageSize,
            shape: AppImageShape.circle,
            fit: BoxFit.cover,
            backgroundColor: AppColors.lightGreys,
            fallback: Icon(Icons.person, size: context.sp(64), color: AppColors.primary,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 4,
            child: Container(
              padding: EdgeInsets.all(context.w(9)),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                size: context.sp(20),
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: context.h(236),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(context.r(30)),
          bottomRight: Radius.circular(context.r(30)),
        ),
      ),
      child: Column(
        children: [
          HeaderAppBar(
            title: Translations.of(context).profile,
            showAction: false,
            titleStyle: context.mediumPx20.copyWith(fontSize: context.sp(20), color: AppColors.white),
            onBackPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(height: context.h(12)),
          _buildProfileImage(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: AppColors.primary,
                          ),
                        )
                      : SingleChildScrollView(
                          padding: EdgeInsets.fromLTRB(
                            context.w(20),
                            context.h(28),
                            context.w(20),
                            context.h(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t.personalInformation,
                                style: context.mediumPx18.copyWith(fontSize: context.sp(18), color: AppColors.textSecondary),
                              ),
                              SizedBox(height: context.h(15)),
                              CustomAppTextField(
                                label: Text(t.name),
                                hintText: t.enterYourFullName,
                                controller: _nameController,
                              ),
                              SizedBox(height: context.h(16)),
                              CustomAppTextField(
                                label: Text(t.contactNumber),
                                hintText: t.enterYourPhoneNumber,
                                controller: _phoneController,
                              ),
                              SizedBox(height: context.h(28)),
                              CustomElevatedButton(
                                onPressed: _isSaving ? null : _saveProfile,
                                label: _isSaving
                                    ? const SizedBox(
                                        width: 22,
                                        height: 22,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: AppColors.white,
                                        ),
                                      )
                                    : Text(
                                        t.kContinue,
                                        style: context.mediumPx18.copyWith(fontSize: context.sp(18)),
                                      ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

