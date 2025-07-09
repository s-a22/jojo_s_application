import 'package:flutter/material.dart'; // These are the Viewport values of your Figma Design.

// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 375;
const num FIGMA_DESIGN_HEIGHT = 667;
const num FIGMA_DESIGN_STATUS_BAR = 0;

// Tablet specific design constants
const num TABLET_BREAKPOINT = 600;
const num TABLET_DESIGN_WIDTH = 768;
const num TABLET_DESIGN_HEIGHT = 1024;

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;

  double get h => SizeUtils.deviceType == DeviceType.tablet
      ? ((this * _width) / TABLET_DESIGN_WIDTH)
      : ((this * _width) / FIGMA_DESIGN_WIDTH);

  double get fSize => SizeUtils.deviceType == DeviceType.tablet
      ? ((this * _width) / TABLET_DESIGN_WIDTH)
      : ((this * _width) / FIGMA_DESIGN_WIDTH);
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

// ignore_for_file: must_be_immutable
class SizeUtils {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Set width and height based on orientation
    if (currentOrientation == Orientation.portrait) {
      width = constraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = constraints.maxHeight.isNonZero();
    } else {
      width = constraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = constraints.maxHeight.isNonZero();
    }

    // Determine device type based on screen size
    double screenWidth = constraints.maxWidth;
    double screenHeight = constraints.maxHeight;
    double minDimension =
        screenWidth < screenHeight ? screenWidth : screenHeight;

    if (minDimension >= TABLET_BREAKPOINT) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.mobile;
    }
  }

  /// Check if current device is tablet
  static bool get isTablet => deviceType == DeviceType.tablet;

  /// Check if current device is mobile
  static bool get isMobile => deviceType == DeviceType.mobile;

  /// Get appropriate column count based on device type and orientation
  static int get columnCount {
    if (deviceType == DeviceType.tablet) {
      return orientation == Orientation.landscape ? 3 : 2;
    }
    return 1;
  }

  /// Get appropriate content width for tablet layouts
  static double get contentWidth {
    if (deviceType == DeviceType.tablet) {
      return orientation == Orientation.landscape ? width * 0.7 : width * 0.85;
    }
    return width;
  }
}
