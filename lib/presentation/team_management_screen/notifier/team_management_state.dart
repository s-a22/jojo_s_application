part of 'team_management_notifier.dart';

class TeamManagementState extends Equatable {
  final TeamManagementModel? teamManagementModel;
  final bool isLoading;

  const TeamManagementState({
    this.teamManagementModel,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        teamManagementModel,
        isLoading,
      ];

  TeamManagementState copyWith({
    TeamManagementModel? teamManagementModel,
    bool? isLoading,
  }) {
    return TeamManagementState(
      teamManagementModel: teamManagementModel ?? this.teamManagementModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
