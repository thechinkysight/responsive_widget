import 'package:flutter/material.dart';
import '../utils/device_enums.dart';
import './device_type.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;

  const ResponsiveWidget({Key? key, required this.mobile, this.tablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceType(builder: (device) {
      if (device == Device.Mobile) {
        return this.mobile;
      }
      return tablet ?? mobile;
    });
  }
}
