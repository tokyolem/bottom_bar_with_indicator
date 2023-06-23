import 'package:bottom_bar_with_indicator/bottom_bar/bar_constants.dart';
import 'package:flutter/material.dart';

/// Defines the theme data for the custom navigation bar.
///
/// The `CustomBarThemeData` class allows convenient customization of the
/// navigation bar widget by specifying options such as
/// [backgroundColor], [activeColor], [inactiveColor],
/// [floating], [cornerRadius], [barMargin],
@immutable
class BarWithIndicatorThemeData {
  /// Creates a `CustomBarThemeData` instance.
  ///
  /// The [backgroundColor], [activeColor], [inactiveColor], [floating],
  /// [cornerRadius], and [barMargin] arguments can be used to customize
  /// the appearance and behavior of the navigation bar.
  factory BarWithIndicatorThemeData({
    Color? backgroundColor,
    Color? activeColor,
    Color? inactiveColor,
    bool? floating,
    BorderRadius? cornerRadius,
    EdgeInsets? barMargin,
  }) {
    backgroundColor ??= BarColors.barColor;
    activeColor ??= BarColors.activeColor;
    inactiveColor ??= BarColors.inactiveColor;
    floating ??= false;
    cornerRadius ??= const BorderRadius.all(Radius.zero);
    barMargin ??= EdgeInsets.zero;

    return BarWithIndicatorThemeData._defaultTheme(
      backgroundColor: backgroundColor,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      floating: floating,
      cornerRadius: cornerRadius,
      barMargin: barMargin,
    );
  }

  /// The background color of the navigation bar.
  final Color backgroundColor;

  /// The color of the selected item in the navigation bar.
  final Color activeColor;

  /// The color of inactive items in the navigation bar.
  final Color inactiveColor;

  /// Determines whether the navigation bar has a floating appearance.
  ///
  /// When set to `true`, the navigation bar will have padding from the parent
  /// widget's borders and slightly rounded corners. When set to `false`, the
  /// default navigation bar model will be used.
  final bool floating;

  /// The corner radius of the navigation bar.
  final BorderRadius cornerRadius;

  /// The padding of the navigation bar from the edges of the parent widget.
  final EdgeInsets barMargin;

  const BarWithIndicatorThemeData._defaultTheme({
    required this.backgroundColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.floating,
    required this.cornerRadius,
    required this.barMargin,
  });
}
