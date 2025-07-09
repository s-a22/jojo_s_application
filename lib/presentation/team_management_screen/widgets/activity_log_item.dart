import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/activity_log_model.dart';

class ActivityLogItem extends StatelessWidget {
  final ActivityLogModel activityLog;
  final VoidCallback? onTapActivity;

  const ActivityLogItem({
    Key? key,
    required this.activityLog,
    this.onTapActivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.maxFinite,
      color: appTheme.colorFF0909,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.h, top: 12.h),
            child: CustomIconButton(
              iconPath: activityLog.iconPath ?? '',
              onPressed: onTapActivity,
              backgroundColor: appTheme.colorFF2830,
              size: 48.h,
              iconSize: 24.h,
              borderRadius: 8.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h, top: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activityLog.title ?? '',
                  style: TextStyleHelper.instance.title16MediumInter,
                ),
                SizedBox(height: 4.h),
                Text(
                  activityLog.description ?? '',
                  style: TextStyleHelper.instance.body14Inter,
                ),
                SizedBox(height: 4.h),
                Text(
                  activityLog.timestamp ?? '',
                  style: TextStyleHelper.instance.body14Inter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
