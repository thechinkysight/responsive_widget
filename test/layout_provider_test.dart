import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_provider/layout_provider.dart';

void main() {
  test("Testing studyViewPort function to set the values properly", () {
    studyViewPort(shortestSide: 800, tabletBreakPoint: 1000);
    expect(getShortestSide, 800);
    expect(getTabletBreakPoint, 1000);
  });

  var app = MaterialApp(
    home: Scaffold(
      body: LayoutProvider(
          mobilePortrait: Center(child: Text("Mobile Portrait")),
          tabletPortrait: Center(child: Text("Tablet Portrait"))),
    ),
  );

  testWidgets(
    "Testing Layout Provider",
    (WidgetTester tester) async {
      await tester.pumpWidget(app);

      //When the shortestSide is greater than and equals to tabletBreakPoint then only Center(child: Text("Tablet Portrait"))
      //is inserted into the widget tree

      //You can check whether there are more than one Text object in the widget tree.
      //If it has more than one Text object in the widget tree, the test below will fail.
      expect(find.byType(Text), findsNWidgets(1));
      expect(find.text("Mobile Portrait"), findsOneWidget);
    },
  );

  test(
      "Testing studyViewPort function to assign default value to tabletBreakPoint",
      () {
    studyViewPort(shortestSide: 200);

    expect(getTabletBreakPoint, 600);
  });
}
