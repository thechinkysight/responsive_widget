import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_widget/src/device_type.dart';
import 'package:responsive_widget/src/utils/device_enums.dart';

void main() {
  Widget app(
      {double breakpointForTablet = 600.0,
      required double deviceShortestSide}) {
    return MaterialApp(
      home: DeviceType(
          breakpointForTablet: breakpointForTablet,
          deviceShortestSide: deviceShortestSide,
          builder: (Device device) => Text(device.toString())),
    );
  }

  testWidgets('The value of device is Device.Tablet',
      (WidgetTester tester) async {
    await tester.pumpWidget(app(deviceShortestSide: 700.0));

    expect(find.text("Device.Tablet"), findsOneWidget);
  });

  testWidgets("The value of device is Device.Mobile",
      (WidgetTester tester) async {
    await tester.pumpWidget(app(deviceShortestSide: 550.0));
    expect(find.text("Device.Mobile"), findsOneWidget);
  });
}
