library layout_provider;

import 'package:flutter/material.dart';
import 'device_type.dart';

part 'study_viewport.dart';

double _shortestSide = 0.0;
double _tabletBreakPoint = 0.0;

//I have created these getters for unit testing only.
//You dont need to uses these in your app.
double get getShortestSide => _shortestSide;
double get getTabletBreakPoint => _tabletBreakPoint;

///This Widget is responsible for returning proper UI for different screens. 
///The mobilePortrait and tabletPortrait is required.
class LayoutProvider extends StatelessWidget {
  final Widget mobilePortrait;
  final Widget mobileLandscape;
  final Widget tabletPortrait;
  final Widget tabletLandscape;

  const LayoutProvider(
      {Key key,
      @required this.mobilePortrait,
      this.mobileLandscape,
      @required this.tabletPortrait,
      this.tabletLandscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _DeviceTypeProvider(
      builder: (deviceType) {
        if (deviceType == DeviceType.tablet) {
          return _OrientationNotifier(
              portrait: tabletPortrait, landscape: tabletLandscape);
        }

        return _OrientationNotifier(
            portrait: mobilePortrait, landscape: mobileLandscape);
      },
    );
  }
}

//This Widget is responsible for indentifying the device type
class _DeviceTypeProvider extends StatefulWidget {
  final Widget Function(DeviceType deviceType) builder;

  const _DeviceTypeProvider({Key key, this.builder}) : super(key: key);

  @override
  __DeviceTypeProviderState createState() => __DeviceTypeProviderState();
}

class __DeviceTypeProviderState extends State<_DeviceTypeProvider> {
  DeviceType deviceType;

  DeviceType _getDeviceType() {
    if (_shortestSide >= _tabletBreakPoint) {
      return DeviceType.tablet;
    }
    return DeviceType.mobile;
  }

  @override
  void initState() {
    super.initState();
    deviceType = _getDeviceType();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(deviceType);
  }
}

//This class is responsible for handling orientation changes
class _OrientationNotifier extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;

  const _OrientationNotifier({Key key, this.landscape, @required this.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return landscape ?? portrait;
      }

      return portrait;
    });
  }
}
