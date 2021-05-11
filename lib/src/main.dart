import 'package:flutter/material.dart';
import '../utils/device_enums.dart';
import './device_type.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final double breakpointForTablet;
  const ResponsiveWidget(
      {Key? key, required this.mobile, this.tablet, this.breakpointForTablet = 600.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceType(
        breakpointForTablet: this.breakpointForTablet,
        builder: (device) {
          if (device == Device.Mobile) {
            return this.mobile;
          }
          return tablet ?? mobile;
        });
  }
}
