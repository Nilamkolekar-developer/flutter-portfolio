import 'package:flutter/material.dart';

/// Simple breakpoint helpers used throughout the app.
class Responsive {
  static const double mobileMax = 700;
  static const double tabletMax = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileMax;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w >= mobileMax && w < tabletMax;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletMax;

  /// Horizontal page padding that scales with screen size.
  static double horizontalPadding(BuildContext context) {
    if (isMobile(context)) return 20;
    if (isTablet(context)) return 48;
    return 96;
  }

  /// Caps content width on very large screens so text doesn't stretch edge
  /// to edge.
  static double contentMaxWidth(BuildContext context) => 1200;
}
