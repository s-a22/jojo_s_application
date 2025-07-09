import '../../../core/app_export.dart';
import './access_control_model.dart';
import './activity_log_model.dart';
import './team_member_model.dart';

class TeamManagementModel extends Equatable {
  List<TeamMemberModel>? teamMembers;
  List<AccessControlModel>? accessControls;
  List<ActivityLogModel>? activityLogs;

  TeamManagementModel({
    this.teamMembers,
    this.accessControls,
    this.activityLogs,
  }) {
    teamMembers = teamMembers ?? [];
    accessControls = accessControls ?? [];
    activityLogs = activityLogs ?? [];
  }

  @override
  List<Object?> get props => [teamMembers, accessControls, activityLogs];

  TeamManagementModel copyWith({
    List<TeamMemberModel>? teamMembers,
    List<AccessControlModel>? accessControls,
    List<ActivityLogModel>? activityLogs,
  }) {
    return TeamManagementModel(
      teamMembers: teamMembers ?? this.teamMembers,
      accessControls: accessControls ?? this.accessControls,
      activityLogs: activityLogs ?? this.activityLogs,
    );
  }
}
