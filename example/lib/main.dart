import 'package:bottom_bar_with_indicator/bottom_bar_with_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom bottom bar',
      home: Scaffold(
        bottomNavigationBar: BottomBarWithIndicator(
          selectedIndex: _selectedIndex,
          onIndexChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          themeData: BarWithIndicatorThemeData(
            backgroundColor: const Color(0xFFF6F6F6),
            activeColor: const Color(0xFF3C5FE6),
            inactiveColor: const Color(0xFFB1B8C2),
            floating: true,
          ),
          items: const <BottomBarWithIndicatorItem>[
            BottomBarWithIndicatorItem(icon: Icons.delete, label: 'Item 1'),
            BottomBarWithIndicatorItem(icon: Icons.delete, label: 'Item 2'),
            BottomBarWithIndicatorItem(icon: Icons.delete, label: 'Item 3'),
          ],
        ),
      ),
    );
  }
}
