import 'package:flutter/material.dart';
import '../utils/device_enums.dart';

class DeviceType extends StatefulWidget {
  final Widget Function(Device device) builder;
  final double breakpointForTablet;
  final double? deviceShortestSide;

  const DeviceType(
      {Key? key,
      required this.builder,
      required this.breakpointForTablet,
      this.deviceShortestSide})
      : super(key: key);

  @override
  _DeviceTypeState createState() => _DeviceTypeState();
}

class _DeviceTypeState extends State<DeviceType> {
  late double deviceShortestSide;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceShortestSide =
        widget.deviceShortestSide ?? MediaQuery.of(context).size.shortestSide;
  }

  @override
  Widget build(BuildContext context) {
    if (deviceShortestSide < widget.breakpointForTablet) {
      return widget.builder(Device.Mobile);
    }
    return widget.builder(Device.Tablet);
  }
}
