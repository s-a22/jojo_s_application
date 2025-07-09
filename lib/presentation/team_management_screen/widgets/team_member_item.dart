import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/team_member_model.dart';

class TeamMemberItem extends StatelessWidget {
  final TeamMemberModel teamMember;

  const TeamMemberItem({
    Key? key,
    required this.teamMember,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.isTablet ? 80.h : 72.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.isTablet ? 20.h : 16.h,
        vertical: SizeUtils.isTablet ? 12.h : 8.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.colorFF0909,
        borderRadius: SizeUtils.isTablet ? BorderRadius.circular(8.h) : null,
        border: SizeUtils.isTablet
            ? Border.all(color: appTheme.colorFF2830, width: 1.h)
            : null,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: teamMember.profileImage ?? '',
            height: SizeUtils.isTablet ? 64.h : 56.h,
            width: SizeUtils.isTablet ? 64.h : 56.h,
            radius: BorderRadius.circular(SizeUtils.isTablet ? 32.h : 28.h),
          ),
          SizedBox(width: SizeUtils.isTablet ? 20.h : 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  teamMember.name ?? '',
                  style: SizeUtils.isTablet
                      ? TextStyleHelper.instance.title18BoldInter
                      : TextStyleHelper.instance.title16MediumInter,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  teamMember.role ?? '',
                  style: SizeUtils.isTablet
                      ? TextStyleHelper.instance.body16Inter
                      : TextStyleHelper.instance.body14Inter,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
