import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomIconButton - A reusable icon button component with customizable styling
 * 
 * This component provides a square icon button with rounded corners, background color,
 * and centered icon. It supports different sizes, colors, and icon assets.
 * 
 * @param iconPath - Path to the icon asset (SVG, PNG, etc.)
 * @param onPressed - Callback function when button is pressed
 * @param backgroundColor - Background color of the button
 * @param size - Size of the button (width and height)
 * @param iconSize - Size of the icon inside the button
 * @param borderRadius - Border radius for rounded corners
 * @param margin - External margin around the button
 * @param tooltip - Accessibility tooltip text
 */
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.iconPath,
    this.onPressed,
    this.backgroundColor,
    this.size,
    this.iconSize,
    this.borderRadius,
    this.margin,
    this.tooltip,
  }) : super(key: key);

  /// Path to the icon asset
  final String iconPath;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Size of the button (width and height)
  final double? size;

  /// Size of the icon inside the button
  final double? iconSize;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// External margin around the button
  final EdgeInsets? margin;

  /// Accessibility tooltip text
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final buttonSize = size ?? 48.h;
    final iconSizeValue = iconSize ?? 24.h;
    final borderRadiusValue = borderRadius ?? 8.h;
    final backgroundColorValue = backgroundColor ?? appTheme.colorFF2830;
    final marginValue = margin ?? EdgeInsets.zero;

    return Container(
      margin: marginValue,
      child: SizedBox(
        height: buttonSize,
        width: buttonSize,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColorValue,
            foregroundColor: appTheme.whiteCustom,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue),
            ),
            elevation: 0,
          ),
          child: CustomImageView(
            imagePath: iconPath,
            height: iconSizeValue,
            width: iconSizeValue,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
