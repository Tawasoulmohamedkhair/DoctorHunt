// enum UserRole { patient, admin }

// class RoleSelectionState {
//   final UserRole selectedRole;

//   const RoleSelectionState({this.selectedRole = UserRole.patient});

//   RoleSelectionState copyWith({UserRole? selectedRole}) {
//     return RoleSelectionState(selectedRole: selectedRole ?? this.selectedRole);
//   }
// }

enum UserRole { patient, admin }

class RoleSelectionState {
  final UserRole selectedRole;

  const RoleSelectionState({this.selectedRole = UserRole.patient});

  RoleSelectionState copyWith({UserRole? selectedRole}) {
    return RoleSelectionState(selectedRole: selectedRole ?? this.selectedRole);
  }
}
