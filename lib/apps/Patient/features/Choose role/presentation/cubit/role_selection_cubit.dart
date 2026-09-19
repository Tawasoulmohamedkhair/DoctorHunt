import 'package:doctor_hunt/apps/Patient/features/Choose%20role/presentation/cubit/role_selection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionCubit extends Cubit<RoleSelectionState> {
  RoleSelectionCubit() : super(const RoleSelectionState());

  void selectRole(UserRole role) {
    emit(state.copyWith(selectedRole: role));
  }

  void submitRole() {
    
  }
}
