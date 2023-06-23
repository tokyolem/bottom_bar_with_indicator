import 'dart:ui';

abstract final class BarDimensions {
  /// Value == 0.
  static const double none = 0;

  /// Value == 2.
  static const double extraSmall = 2;

  /// Value == 4.
  static const double small = 4;

  /// Value == 8.
  static const double medium = 8;

  /// Value == 16.
  static const double large = 16;

  /// Value == 32.
  static const double extraLarge = 32;

  /// Value == 90.
  static const double customBarHeight = 90;

  /// Value == 80.
  static const double barItemWidth = 80;

  /// Value == 3.
  static const double barIndicatorStrokeWidth = 3;

  /// Value == 300.
  static const double absoluteCircle = 300;
}

abstract final class BarColors {
  static const Color barColor = Color(0xFFF6F6F6);
  static const Color activeColor = Color(0xFF3C5FE6);
  static const Color inactiveColor = Color(0xFFB1B8C2);
  static const Color labelColor = Color(0xFFB1B8C2);
}

abstract final class BarDurations {

  /// Value == 200 milliseconds.
  static const Duration small =
  Duration(milliseconds: 200);
}
