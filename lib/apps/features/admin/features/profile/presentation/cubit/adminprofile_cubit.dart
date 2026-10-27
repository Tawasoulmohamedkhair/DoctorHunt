import 'dart:io';

import 'package:doctor_hunt/apps/features/admin/core/repository/admin_repository.dart';
import 'package:doctor_hunt/apps/features/admin/features/profile/presentation/cubit/adminprofile_state.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProfileCubit extends Cubit<AdminProfileState> {
  final AdminRepository _repository;

  bool _isProcessing = false;

  AdminProfileCubit(this._repository) : super(const AdminProfileState());

  Future<void> loadProfile() async {
    if (_isProcessing) return;

    _isProcessing = true;

    emit(
      state.copyWith(
        status: AdminProfileStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      final profile = await _repository.getAdmin();

      if (isClosed) return;

      emit(
        state.copyWith(status: AdminProfileStatus.success, profile: profile),
      );
    } catch (e) {
      if (isClosed) return;


      emit(
        state.copyWith(
          status: AdminProfileStatus.failure,
          errorMessage: t.unableToLoadAdminProfile,
        ),
      );
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> updateProfile({
    required String fullName,
    required String clinicLocation,
    double? latitude,
    double? longitude,
    File? imageFile,
    String? extension,
  }) async {
    if (_isProcessing) return;

    _isProcessing = true;

    emit(
      state.copyWith(
        status: AdminProfileStatus.saving,
        clearErrorMessage: true,
      ),
    );

    try {
      if (imageFile != null && extension != null) {
        await _repository.uploadProfileImage(
          file: imageFile,
          extension: extension,
        );
      }
      if (isClosed) return;

      await _repository.updateProfile(
        fullName: fullName,
        clinicLocation: clinicLocation,
        latitude: latitude,
        longitude: longitude,
      );
      if (isClosed) return;

      final profile = await _repository.getAdmin();
      if (isClosed) return;

      emit(state.copyWith(status: AdminProfileStatus.saved, profile: profile));
    } catch (e) {
      
      if (isClosed) return;

      emit(
        state.copyWith(
          status: AdminProfileStatus.failure,
          errorMessage: t.unableToSaveAdminProfile,
        ),
      );
    } finally {
      _isProcessing = false;
    }
  }
}
