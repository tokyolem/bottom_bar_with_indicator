import 'dart:io';

import 'package:bottom_bar_with_indicator/bottom_bar/bar_constants.dart';
import 'package:bottom_bar_with_indicator/bottom_bar/bar_scroll_behavior.dart';
import 'package:bottom_bar_with_indicator/bottom_bar/bar_with_indicator_theme.dart';
import 'package:bottom_bar_with_indicator/bottom_bar/bar_with_indicator_theme_data.dart';
import 'package:flutter/material.dart';

class BottomBarWithIndicator extends StatelessWidget {
  final List<BottomBarWithIndicatorItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onIndexChanged;
  final BarWithIndicatorThemeData? themeData;

  const BottomBarWithIndicator({
    required this.items,
    required this.selectedIndex,
    this.onIndexChanged,
    this.themeData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BarWithIndicatorTheme(
      data: themeData ?? BarWithIndicatorThemeData(),
      child: Builder(
        builder: (context) {
          return _BarContainer(
            items: items,
            selectedIndex: selectedIndex,
            onIndexChanged: onIndexChanged,
          );
        },
      ),
    );
  }
}

class _BarContainer extends StatefulWidget {
  final List<BottomBarWithIndicatorItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onIndexChanged;

  const _BarContainer({
    required this.items,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  State<_BarContainer> createState() => _BarContainerState();
}

class _BarContainerState extends State<_BarContainer>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: widget.items.length, vsync: this)
      ..index = widget.selectedIndex;
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final floating = BarWithIndicatorTheme.of(context).floating;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: BarDimensions.customBarHeight,
      margin: floating
          ? const EdgeInsets.all(BarDimensions.large)
          : BarWithIndicatorTheme.of(context).barMargin,
      decoration: BoxDecoration(
        color: BarWithIndicatorTheme.of(context).backgroundColor,
        borderRadius: floating
            ? const BorderRadius.all(Radius.circular(BarDimensions.large))
            : BarWithIndicatorTheme.of(context).cornerRadius,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isScrollable = _isScrollable(constraints);

          return ScrollConfiguration(
            behavior: BarScrollBehavior(),
            child: TabBar(
              isScrollable: isScrollable,
              controller: _tabController,
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (state) => state.contains(MaterialState.focused)
                    ? null
                    : Colors.transparent,
              ),
              indicatorPadding: EdgeInsets.symmetric(
                horizontal: isScrollable
                    ? BarDimensions.large
                    : constraints.maxWidth /
                        (widget.items.length * widget.items.length),
              ),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: BarWithIndicatorTheme.of(context).activeColor,
                  width: BarDimensions.barIndicatorStrokeWidth,
                ),
                insets: const EdgeInsets.only(
                  bottom: BarDimensions.customBarHeight -
                      BarDimensions.barIndicatorStrokeWidth -
                      1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(BarDimensions.extraLarge),
                ),
              ),
              onTap: widget.onIndexChanged,
              tabs: [
                for (var index = 0; index < widget.items.length; index++)
                  _BarItem(
                    item: widget.items[index],
                    itemColor: index == widget.selectedIndex
                        ? BarWithIndicatorTheme.of(context).activeColor
                        : BarWithIndicatorTheme.of(context).inactiveColor,
                    selectedIndex: widget.selectedIndex,
                    itemIndex: index,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isScrollable(BoxConstraints constraints) {
    final isMobile = Platform.isAndroid || Platform.isIOS;

    return isMobile
        ? widget.items.length >= 5 && constraints.maxWidth < 400
        : constraints.maxWidth <
            widget.items.length * BarDimensions.barItemWidth + 10;
  }
}

class _BarItem extends StatelessWidget {
  final BottomBarWithIndicatorItem item;
  final Color itemColor;
  final int selectedIndex;
  final int itemIndex;

  const _BarItem({
    required this.item,
    required this.itemColor,
    required this.itemIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        width: BarDimensions.barItemWidth,
        duration: BarDurations.small,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(BarDimensions.large),
              child: Icon(item.icon, color: itemColor),
            ),
            AnimatedSize(
              duration: BarDurations.small,
              curve: Curves.easeInOut,
              child: SizedBox(
                height: selectedIndex == itemIndex ? null : 0,
                child: Text(
                  item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: BarWithIndicatorTheme.of(context).inactiveColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarWithIndicatorItem {
  final IconData icon;
  final String label;

  const BottomBarWithIndicatorItem({
    required this.icon,
    required this.label,
  });
}
