part of layout_provider;

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

GlobalKey<NavigatorState> get getNavigatorKey => _navigatorKey;

///This function will get the shortestSide from the media query and use it to decide the device type.
///You can assign your custom breakpoint for tablet to tabletBreakPoint.
///If the shortestSide of your device is greater than or equals to the tabletBreakPoint, then it will consider the
///device as Tabet. You don't need to use the shortestSide named parameter, it's here only for testing purpose.
void studyViewPort({double tabletBreakPoint = 600, double shortestSide}) {
  _shortestSide = shortestSide ??
      MediaQuery.of(_navigatorKey.currentContext).size.shortestSide;
  _tabletBreakPoint = tabletBreakPoint;
}
