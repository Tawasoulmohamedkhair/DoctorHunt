import 'dart:io';

import 'package:doctor_hunt/apps/admin/data/repository/admin_repository.dart';
import 'package:doctor_hunt/apps/admin/features/profile/presentation/cubit/adminprofile_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProfileCubit extends Cubit<AdminProfileState> {
  final AdminRepository _repository;

  AdminProfileCubit(this._repository) : super(const AdminProfileState());

  Future<void> loadProfile() async {
    emit(
      state.copyWith(status: AdminProfileStatus.loading, errorMessage: null),
    );

    try {
      final profile = await _repository.getAdmin();

      emit(
        state.copyWith(status: AdminProfileStatus.success, profile: profile),
      );
    } catch (e, stackTrace) {
      debugPrint('ADMIN PROFILE LOAD ERROR: $e');
      debugPrint('STACK TRACE: $stackTrace');

      emit(
        state.copyWith(
          status: AdminProfileStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> updateProfile({
    required String fullName,
    required String clinicLocation,
    File? imageFile,
    String? extension,
  }) async {
    emit(state.copyWith(status: AdminProfileStatus.saving, errorMessage: null));

    try {
      if (imageFile != null && extension != null) {
        await _repository.uploadProfileImage(
          file: imageFile,
          extension: extension,
        );
      }

      await _repository.updateProfile(
        fullName: fullName,
        clinicLocation: clinicLocation,
      );

      final profile = await _repository.getAdmin();

      emit(
        state.copyWith(status: AdminProfileStatus.success, profile: profile),
      );
    } catch (e, stackTrace) {
      debugPrint('ADMIN PROFILE SAVE ERROR: $e');
      debugPrint('STACK TRACE: $stackTrace');

      emit(
        state.copyWith(
          status: AdminProfileStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
