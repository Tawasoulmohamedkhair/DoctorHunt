import 'package:doctor_hunt/apps/features/common/choose_role/presentation/cubit/role_selection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionCubit extends Cubit<RoleSelectionState> {
  RoleSelectionCubit() : super(const RoleSelectionState());

  void selectRole(UserRole role) {
    emit(state.copyWith(selectedRole: role));
  }
}
