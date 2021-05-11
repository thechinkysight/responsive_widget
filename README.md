# Responsive Widget

Responsive Widget is a package for rendering proper layouts for mobile and tablet inspired from [responsive_builder](https://pub.dev/packages/responsive_builder)

## Installation

In your `pubspec.yaml`:

```yaml
dependencies:
  responsive_widget:
    git:
      url: https://github.com/chinkysight/responsive_widget
      ref: v2.0.0
```

For more information on package dependencies, <https://dart.dev/tools/pub/dependencies>

## Usage

First import the package

```dart
import 'package:responsive_widget/responsive_widget.dart';
```

Then wrap your views with `ResponsiveWidget`

```dart
ResponsiveWidget(mobile: MyAppMobile(), tablet: MyAppTablet());
```

Voila! we are done

You can also set your own breakpoint for tablet

```dart
ResponsiveWidget(mobile: MyAppMobile(), tablet: MyAppTablet(), breakpointForTablet: 750.0);
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:responsive_widget/responsive_widget.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveWidget(mobile: HomeMobile(), tablet: HomeTablet()),
    );
  }
}

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Mobile")),
    );
  }
}

class HomeTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Tablet")),
    );
  }
}
```
