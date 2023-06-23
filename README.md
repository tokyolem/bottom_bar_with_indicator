## Bottom Bar With Indicator
A Bottom navigation panel with top indicator.

Click [**here**](https://github.com/tokyolem/bottom_bar_with_indicator/blob/main/example/lib/main.dart) to view the full example.

## Installing
Add it to your `pubspec.yaml` file:
```yml
dependencies:
  bottom_bar_with_indicator: ^0.0.1
```
Install packages from the command line
```
flutter pub get
```
## Usage

You can use this in the following way:

```dart
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
```

### Result:

![ezgif com-video-to-gif](https://github.com/tokyolem/bottom_bar_with_indicator/assets/93796040/437c9680-67da-4251-a57a-377095d2f213)


## Customization

You can customize the widget to your liking. There is a helper `BarWithIndicatorThemeData` class for this.

| Parameter        | Description                                                                                                   |
|------------------|---------------------------------------------------------------------------------------------------------------|
| backgroundColor  | The background color of the navigation bar.                                    |
| activeColor   | The color of the selected item in the navigation bar.                                  |
| inactiveColor      | The color of inactive items in the navigation bar.       |
| floating     | Determines whether the navigation bar has a floating appearance. When set to `true`, the navigation bar will have padding from the parent widget's borders and slightly rounded corners. When set to `false`, the default navigation bar model will be used.                                             |
| cornerRadius          | The corner radius of the navigation bar.                                                  |
| barMargin | The padding of the navigation bar from the edges of the parent widget.      |
