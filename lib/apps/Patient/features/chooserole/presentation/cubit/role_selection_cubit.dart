// enum UserRole {
//   patient,
//   admin,
// }

// class RoleSelectionState {
//   final UserRole selectedRole;

//   const RoleSelectionState({
//     this.selectedRole = UserRole.patient,
//   });

//   RoleSelectionState copyWith({
//     UserRole? selectedRole,
//   }) {
//     return RoleSelectionState(
//       selectedRole: selectedRole ?? this.selectedRole,
//     );
//   }
// }
// import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RoleSelectionCubit extends Cubit<RoleSelectionState> {
//   RoleSelectionCubit() : super(const RoleSelectionState());

//   void selectRole(UserRole role) {
//     emit(state.copyWith(selectedRole: role));
//   }

//   void submitRole() {}
// }

import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionCubit extends Cubit<RoleSelectionState> {
  RoleSelectionCubit() : super(const RoleSelectionState());

  void selectRole(UserRole role) {
    emit(state.copyWith(selectedRole: role));
  }
}
