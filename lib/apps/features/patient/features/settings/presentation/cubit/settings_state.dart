import 'package:equatable/equatable.dart';

enum SettingsProfileStatus { initial, loading, success, failure }

enum SettingsLogoutStatus { initial, loading, success, failure }

class SettingsState extends Equatable {
  final SettingsProfileStatus profileStatus;
  final SettingsLogoutStatus logoutStatus;

  final String userName;
  final String userEmail;
  final String? avatarUrl;
  final String? errorMessage;

  const SettingsState({
    this.profileStatus = SettingsProfileStatus.initial,
    this.logoutStatus = SettingsLogoutStatus.initial,
    this.userName = '',
    this.userEmail = '',
    this.avatarUrl,
    this.errorMessage,
  });

  bool get isLoadingProfile => profileStatus == SettingsProfileStatus.loading;

  bool get isLoggingOut => logoutStatus == SettingsLogoutStatus.loading;

  SettingsState copyWith({
    SettingsProfileStatus? profileStatus,
    SettingsLogoutStatus? logoutStatus,
    String? userName,
    String? userEmail,
    String? avatarUrl,
    String? errorMessage,
    bool clearAvatarUrl = false,
    bool clearErrorMessage = false,
  }) {
    return SettingsState(
      profileStatus: profileStatus ?? this.profileStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      avatarUrl: clearAvatarUrl ? null : avatarUrl ?? this.avatarUrl,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    profileStatus,
    logoutStatus,
    userName,
    userEmail,
    avatarUrl,
    errorMessage,
  ];
}
