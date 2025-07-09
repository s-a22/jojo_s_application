import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/access_control_model.dart';

class AccessControlItem extends StatelessWidget {
  final AccessControlModel accessControl;
  final VoidCallback? onTapAccessControl;

  const AccessControlItem({
    Key? key,
    required this.accessControl,
    this.onTapAccessControl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: double.maxFinite,
      color: appTheme.colorFF0909,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: CustomIconButton(
              iconPath: accessControl.iconPath ?? '',
              onPressed: onTapAccessControl,
              backgroundColor: appTheme.colorFF2830,
              size: 48.h,
              iconSize: 24.h,
              borderRadius: 8.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  accessControl.title ?? '',
                  style: TextStyleHelper.instance.title16MediumInter,
                ),
                SizedBox(height: 4.h),
                Text(
                  accessControl.status ?? '',
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
