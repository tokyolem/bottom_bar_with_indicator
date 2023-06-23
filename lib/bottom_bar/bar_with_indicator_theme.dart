import 'package:bottom_bar_with_indicator/bottom_bar/bar_with_indicator_theme_data.dart';
import 'package:flutter/material.dart';

/// A widget that defines the theme data for a custom bar.
///
/// The `CustomBarTheme` widget is used to provide the theme data to the
/// descendant widgets in the widget tree. It wraps its `child` widget and
/// allows accessing the `CustomBarThemeData` using `CustomBarTheme.of(context)`.
///
/// The `CustomBarTheme` widget should be placed above the widgets that need
/// to access the custom bar theme data in the widget tree.
class BarWithIndicatorTheme extends StatelessWidget {
  /// Creates a `CustomBarTheme`.
  ///
  /// The `child` and `data` arguments must not be null.
  const BarWithIndicatorTheme({
    required this.child,
    required this.data,
    super.key,
  });

  /// The widget below this `CustomBarTheme` widget in the widget tree.
  final Widget child;

  /// The theme data for the custom bar.
  final BarWithIndicatorThemeData data;

  /// Retrieves the `CustomBarThemeData` from the nearest ancestor
  /// `CustomBarTheme` widget.
  ///
  /// Returns the `CustomBarThemeData` if it exists, otherwise returns
  /// a default `CustomBarThemeData`.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// CustomBarThemeData theme = CustomBarTheme.of(context);
  /// ```
  static BarWithIndicatorThemeData of(BuildContext context) {
    final inheritedTheme =
    context.dependOnInheritedWidgetOfExactType<_InheritedCustomBarTheme>();

    final theme = inheritedTheme?.theme.data;
    return theme ?? BarWithIndicatorThemeData();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedCustomBarTheme(
      theme: this,
      child: child,
    );
  }
}

/// An inherited widget that holds the `CustomBarTheme` data.
class _InheritedCustomBarTheme extends InheritedTheme {
  const _InheritedCustomBarTheme({
    required this.theme,
    required super.child,
  });

  /// The `CustomBarTheme` associated with this inherited widget.
  final BarWithIndicatorTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BarWithIndicatorTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedCustomBarTheme old) =>
      theme.data != old.theme.data;
}
