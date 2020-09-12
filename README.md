# Layout Provider

This Layout Provider package is inspired from the [responsive_builder](https://pub.dev/packages/responsive_builder) package for rendering proper layout for mobile and tablet. It's not the same package as the responsive_builder, I had changed the codes as per my comfort and it's very simple that even a beginner can understand.

## Installation

I had not published this package on [pub](https://pub.dev/), due to reason the installation will be little different.

In your `pubspec.yaml`:

```yaml
dependencies:
  layout_provider:
    git:
      url: https://github.com/chinkysight/packages/layout_provider.git
      ref: v0.0.1
      path: layout_provider
```

For more information on package dependencies, <https://dart.dev/tools/pub/dependencies>

## Usage

At first you have to assign a `navigatorKey` to your `MaterialApp`, and for that you can use `getNavigatorKey` from the package:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_provider/layout_provider.dart';

void main() {
  runApp(MaterialApp(
    navigatorKey: getNavigatorKey,
    home: Home(),
  ));
}
```

You can use `getNavigatorKey` for other purposes as well.

### Layout Provider(Widget)

Before using `LayoutProvider,` you need to execute the`studyViewPort()` function and it's compulsory. What this function does is that, it fetches the device width so that we can know the device type.

I would recommend you to execute this function inside the `initState()` of your base view:

```dart
  @override
  void initState() {
    super.initState();
    studyViewPort();
  }
```

**Caution:** In order to use the `initState()` function, your base view should be a `Stateful Widget`

As we are done with the `studyViewPort()` function, now we can use the `LayoutProvider`:

```dart
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    studyViewPort();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutProvider(
        mobilePortrait: Scaffold(body: Container(color: Colors.purple)),
        mobileLandscape: Scaffold(body: Container(color: Colors.yellow)),
        tabletPortrait: Scaffold(body: Container(color: Colors.redAccent)),
        tabletLandscape: Scaffold(body: Container(color: Colors.green)));
  }
}
```

What `LayoutProvider` does is that, it makes our **user interface(UI)** reponsive in the sense of both device type and orientation. When we are running the app on a mobile and it's in portrait mode, then the screen will be colored in purple, when it's in landscape mode the screen will be colored in yellow likewise on a tablet in portrait mode, screen will be colored in redAccent and finally when it's in landscape mode the screen will be colored in green.

**Caution:** It is mandatory to give a widget to both `mobilePortrait` & `tabletPortrait` and the remaining are optional. Okay let's say we have a `LayoutProvider` like this:

```dart
LayoutProvider(
      mobilePortrait: Scaffold(body: Container(color: Colors.purple)),
      tabletPortrait: Scaffold(body: Container(color: Colors.redAccent)),
    );
```

Which has only required parameters filled. When we change the orientation to landscape on mobiles, the screen will be same as in the portrait. It because `LayoutProvider` is clever enough to use `mobilePortrait` instead, when we dont have `mobileLandscape` filled and it goes same for tablets as well.

## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_provider/layout_provider.dart';

void main() {
  runApp(MaterialApp(
    navigatorKey: getNavigatorKey,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    studyViewPort();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutProvider(
        mobilePortrait: Scaffold(body: Container(color: Colors.purple)),
        mobileLandscape: Scaffold(body: Container(color: Colors.yellow)),
        tabletPortrait: Scaffold(body: Container(color: Colors.redAccent)),
        tabletLandscape: Scaffold(body: Container(color: Colors.green)));
  }
}
```
# layout_provider
