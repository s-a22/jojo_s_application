import '../../../core/app_export.dart';
import '../models/access_control_model.dart';
import '../models/activity_log_model.dart';
import '../models/team_management_model.dart';
import '../models/team_member_model.dart';

part 'team_management_state.dart';

final teamManagementNotifier = StateNotifierProvider.autoDispose<
    TeamManagementNotifier, TeamManagementState>(
  (ref) => TeamManagementNotifier(
    TeamManagementState(
      teamManagementModel: TeamManagementModel(),
    ),
  ),
);

class TeamManagementNotifier extends StateNotifier<TeamManagementState> {
  TeamManagementNotifier(TeamManagementState state) : super(state) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
      teamManagementModel: TeamManagementModel(
        teamMembers: [
          TeamMemberModel(
            id: '1',
            name: 'Ethan Harper',
            role: 'Admin',
            profileImage: ImageConstant.imgDepth3Frame0,
          ),
          TeamMemberModel(
            id: '2',
            name: 'Sophia Bennett',
            role: 'Editor',
            profileImage: ImageConstant.imgDepth3Frame056x56,
          ),
          TeamMemberModel(
            id: '3',
            name: 'Liam Carter',
            role: 'Viewer',
            profileImage: ImageConstant.imgDepth3Frame01,
          ),
        ],
        accessControls: [
          AccessControlModel(
            id: '1',
            type: 'documents',
            title: 'Documents',
            status: 'Full access',
            iconPath: ImageConstant.imgDepth3Frame0WhiteA700,
          ),
          AccessControlModel(
            id: '2',
            type: 'chats',
            title: 'Chats',
            status: 'Read-only',
            iconPath: ImageConstant.imgDepth3Frame0WhiteA70048x48,
          ),
          AccessControlModel(
            id: '3',
            type: 'files',
            title: 'Files',
            status: 'Restricted',
            iconPath: ImageConstant.imgDepth3Frame048x48,
          ),
        ],
        activityLogs: [
          ActivityLogModel(
            id: '1',
            type: 'document-updated',
            title: 'Document Updated',
            description: 'Ethan Harper edited \'Project Proposal\'',
            timestamp: '2 hours ago',
            iconPath: ImageConstant.imgDepth3Frame0WhiteA700,
          ),
          ActivityLogModel(
            id: '2',
            type: 'file-shared',
            title: 'File Shared',
            description: 'Sophia Bennett shared \'Marketing Plan\'',
            timestamp: 'Yesterday',
            iconPath: ImageConstant.imgDepth3Frame048x48,
          ),
        ],
      ),
    );
  }

  void handleAccessControl(String type) {
    final updatedAccessControls =
        state.teamManagementModel?.accessControls?.map((control) {
      if (control.type == type) {
        return control.copyWith(
          status: 'Managing...',
        );
      }
      return control;
    }).toList();

    state = state.copyWith(
      teamManagementModel: state.teamManagementModel?.copyWith(
        accessControls: updatedAccessControls,
      ),
    );
  }

  void viewActivity(String activityType) {
    final updatedActivityLogs =
        state.teamManagementModel?.activityLogs?.map((activity) {
      if (activity.type == activityType) {
        return activity.copyWith(
          isViewed: true,
        );
      }
      return activity;
    }).toList();

    state = state.copyWith(
      teamManagementModel: state.teamManagementModel?.copyWith(
        activityLogs: updatedActivityLogs,
      ),
    );
  }
}
