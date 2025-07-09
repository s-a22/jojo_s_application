import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './widgets/access_control_item.dart';
import './widgets/activity_log_item.dart';
import './widgets/team_member_item.dart';
import 'notifier/team_management_notifier.dart';

class TeamManagementScreen extends ConsumerStatefulWidget {
  const TeamManagementScreen({Key? key}) : super(key: key);

  @override
  TeamManagementScreenState createState() => TeamManagementScreenState();
}

class TeamManagementScreenState extends ConsumerState<TeamManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.colorFF0909,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: SizeUtils.isTablet
                    ? _buildTabletLayout(context)
                    : _buildMobileLayout(context),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  /// Tablet optimized layout
  Widget _buildTabletLayout(BuildContext context) {
    return Row(
      children: [
        // Main content area
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxWidth: SizeUtils.contentWidth),
              child: SizeUtils.orientation == Orientation.landscape
                  ? _buildLandscapeTabletContent(context)
                  : _buildPortraitTabletContent(context),
            ),
          ),
        ),
        // Side panel for additional information or quick actions
        if (SizeUtils.orientation == Orientation.landscape)
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: appTheme.colorFF1C21,
                border: Border(
                  left: BorderSide(
                    color: appTheme.colorFF2830,
                    width: 1.h,
                  ),
                ),
              ),
              child: _buildSidePanel(context),
            ),
          ),
      ],
    );
  }

  /// Mobile layout (original)
  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTeamMembersSection(context),
          _buildAccessControlsSection(context),
          _buildActivityLogSection(context),
        ],
      ),
    );
  }

  /// Landscape tablet content with grid layout
  Widget _buildLandscapeTabletContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Team Members - Left Column
              Expanded(
                flex: 2,
                child: _buildTeamMembersSection(context),
              ),
              SizedBox(width: 24.h),
              // Access Controls - Right Column
              Expanded(
                flex: 1,
                child: _buildAccessControlsSection(context),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          // Activity Log - Full Width
          _buildActivityLogSection(context),
        ],
      ),
    );
  }

  /// Portrait tablet content with optimized spacing
  Widget _buildPortraitTabletContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: Column(
        children: [
          _buildTeamMembersSection(context),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildAccessControlsSection(context)),
              SizedBox(width: 24.h),
              Expanded(child: _buildActivityLogSection(context)),
            ],
          ),
        ],
      ),
    );
  }

  /// Side panel for landscape tablet mode
  Widget _buildSidePanel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: TextStyleHelper.instance.title18BoldInter,
          ),
          SizedBox(height: 16.h),
          _buildQuickActionButton('Add Member', Icons.person_add),
          SizedBox(height: 12.h),
          _buildQuickActionButton('Settings', Icons.settings),
          SizedBox(height: 12.h),
          _buildQuickActionButton('Reports', Icons.analytics),
          SizedBox(height: 32.h),
          Text(
            'Team Stats',
            style: TextStyleHelper.instance.title16MediumInter,
          ),
          SizedBox(height: 16.h),
          Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(teamManagementNotifier);
              final memberCount =
                  state.teamManagementModel?.teamMembers?.length ?? 0;
              final activityCount =
                  state.teamManagementModel?.activityLogs?.length ?? 0;

              return Column(
                children: [
                  _buildStatItem('Members', memberCount.toString()),
                  SizedBox(height: 8.h),
                  _buildStatItem('Activities', activityCount.toString()),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  /// Quick action button widget
  Widget _buildQuickActionButton(String title, IconData icon) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: appTheme.colorFF2830,
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: Row(
        children: [
          Icon(icon, color: appTheme.whiteCustom, size: 20.h),
          SizedBox(width: 12.h),
          Text(
            title,
            style: TextStyleHelper.instance.body14Inter,
          ),
        ],
      ),
    );
  }

  /// Stat item widget
  Widget _buildStatItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyleHelper.instance.body14Inter,
        ),
        Text(
          value,
          style: TextStyleHelper.instance.title14BoldInter,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: SizeUtils.isTablet ? 80.h : 72.h,
      width: double.maxFinite,
      color: appTheme.colorFF0909,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              onTapBackButton(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 16.h, top: 4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgDepth4Frame0,
                height: 24.h,
                width: 24.h,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'CollabVault',
                style: SizeUtils.isTablet
                    ? TextStyleHelper.instance.title22BoldInter
                    : TextStyleHelper.instance.title18BoldInter,
              ),
            ),
          ),
          SizedBox(width: 40.h), // Balance the back button
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTeamMembersSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(teamManagementNotifier);

        return Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.h, top: 20.h),
                child: Text(
                  'Team Members',
                  style: TextStyleHelper.instance.title22BoldInter,
                ),
              ),
              SizedBox(height: 16.h),
              SizeUtils.isTablet
                  ? _buildTeamMembersGrid(state)
                  : _buildTeamMembersList(state),
            ],
          ),
        );
      },
    );
  }

  /// Grid layout for team members on tablets
  Widget _buildTeamMembersGrid(state) {
    final teamMembers = state.teamManagementModel?.teamMembers ?? [];
    final columnCount = SizeUtils.columnCount;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        childAspectRatio: 4.5,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 16.h,
      ),
      itemCount: teamMembers.length,
      itemBuilder: (context, index) {
        return TeamMemberItem(
          teamMember: teamMembers[index],
        );
      },
    );
  }

  /// List layout for team members on mobile
  Widget _buildTeamMembersList(state) {
    return Container(
      height: 216.h,
      width: double.maxFinite,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.teamManagementModel?.teamMembers?.length ?? 0,
        itemBuilder: (context, index) {
          final teamMember = state.teamManagementModel?.teamMembers?[index];
          return TeamMemberItem(
            teamMember: teamMember!,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildAccessControlsSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(teamManagementNotifier);

        return Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.h, top: 20.h),
                child: Text(
                  'Access Controls',
                  style: TextStyleHelper.instance.title22BoldInter,
                ),
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    state.teamManagementModel?.accessControls?.length ?? 0,
                itemBuilder: (context, index) {
                  final accessControl =
                      state.teamManagementModel?.accessControls?[index];
                  return AccessControlItem(
                    accessControl: accessControl!,
                    onTapAccessControl: () {
                      onTapAccessControl(context, accessControl.type ?? '');
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildActivityLogSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(teamManagementNotifier);

        return Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.h, top: 20.h),
                child: Text(
                  'Activity Log',
                  style: TextStyleHelper.instance.title22BoldInter,
                ),
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.teamManagementModel?.activityLogs?.length ?? 0,
                itemBuilder: (context, index) {
                  final activityLog =
                      state.teamManagementModel?.activityLogs?[index];
                  return ActivityLogItem(
                    activityLog: activityLog!,
                    onTapActivity: () {
                      onTapActivity(context, activityLog.type ?? '');
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: SizeUtils.isTablet ? 100.h : 113.h,
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            height: SizeUtils.isTablet ? 80.h : 93.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: appTheme.colorFF1C21,
              border: Border(
                top: BorderSide(
                  color: appTheme.colorFF2830,
                  width: 1.h,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(
                  ImageConstant.imgDepth4Frame0BlueGray300,
                  'Home',
                  false,
                ),
                _buildBottomNavItem(
                  ImageConstant.imgDepth4Frame0WhiteA700,
                  'Collaboration',
                  true,
                ),
                _buildBottomNavItem(
                  ImageConstant.imgDepth4Frame0BlueGray30032x24,
                  'Chat',
                  false,
                ),
                _buildBottomNavItem(
                  ImageConstant.imgDepth4Frame032x24,
                  'Files',
                  false,
                ),
                _buildBottomNavItem(
                  ImageConstant.imgDepth4Frame01,
                  'Settings',
                  false,
                ),
              ],
            ),
          ),
          Container(
            height: SizeUtils.isTablet ? 20.h : 20.h,
            width: double.maxFinite,
            color: appTheme.colorFF1C21,
          ),
        ],
      ),
    );
  }

  /// Bottom Navigation Item
  Widget _buildBottomNavItem(String iconPath, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: iconPath,
          height: SizeUtils.isTablet ? 40.h : 32.h,
          width: SizeUtils.isTablet ? 30.h : 24.h,
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: (SizeUtils.isTablet
                  ? TextStyleHelper.instance.body14Inter
                  : TextStyleHelper.instance.body12MediumInter)
              .copyWith(
                  color:
                      isActive ? appTheme.whiteCustom : appTheme.colorFF9EAA),
        ),
      ],
    );
  }

  /// Navigates back to the previous screen.
  void onTapBackButton(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Handles access control management.
  void onTapAccessControl(BuildContext context, String type) {
    ref.read(teamManagementNotifier.notifier).handleAccessControl(type);
  }

  /// Handles activity viewing.
  void onTapActivity(BuildContext context, String activityType) {
    ref.read(teamManagementNotifier.notifier).viewActivity(activityType);
  }
}
