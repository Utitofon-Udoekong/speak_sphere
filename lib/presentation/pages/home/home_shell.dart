import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:speak_sphere/constants/asset_strings.dart';
import 'package:speak_sphere/constants/colors.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key, required this.child});
  final Widget child;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: NavigationBar(
        height: 55,
        onDestinationSelected: _routeToPage,
        selectedIndex: currentPageIndex,
        destinations: tabs,
        indicatorShape: const NavIndicator(radius: 10, indicatorHeight: 3),
        indicatorColor: AppColors.primary,
      ),
    );
  }

  _routeToPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
    context.go(tabs[currentPageIndex].initialLocation);
  }
}

class HomeScaffoldNavBarTabItem extends NavigationDestination {
  final String initialLocation;
  const HomeScaffoldNavBarTabItem( 
      {super.key, required this.initialLocation, required Widget icon, required Widget selectedIcon, required String label})
      : super(icon: icon, selectedIcon: selectedIcon, label: label);

}

var tabs = [
  HomeScaffoldNavBarTabItem(
    initialLocation: '/home',
    label: 'Home',
    icon: Image.asset(Assets.home),
    selectedIcon: Image.asset(Assets.home_active),
  ),
  HomeScaffoldNavBarTabItem(
    initialLocation: '/lessons',
    label: 'Lesson',
    icon: Image.asset(Assets.lesson),
    selectedIcon: Image.asset(Assets.lesson_active),
  ),
  HomeScaffoldNavBarTabItem(
    initialLocation: '/exercise',
    label: 'Exercises',
    icon: Image.asset(Assets.exercise),
    selectedIcon: Image.asset(Assets.exercise_active),
  ),
  HomeScaffoldNavBarTabItem(
    initialLocation: '/games',
    label: 'Games',
    icon: Image.asset(Assets.games),
    selectedIcon: Image.asset(Assets.games_active),
  ),
  HomeScaffoldNavBarTabItem(
    initialLocation: '/chat',
    label: 'Chats',
    icon: Image.asset(Assets.chat),
    selectedIcon: Image.asset(Assets.chat_active),
  ),
];

class NavIndicator extends ShapeBorder {
  const NavIndicator(
    {
    required this.radius,
    required this.indicatorHeight,
    this.color = AppColors.primary
  });
  final double radius;
  final Color color;
  final double indicatorHeight;
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    // Starting point of the indicator
    final indicatorStart = (rect.width / 2) - 15;
    // End point of the indicator. 
    final indicatorEnd = (rect.width / 2) + 15;
    //Offsets the path to be at the [indicatorStart]
    path.moveTo(indicatorStart, 0);
    // paints a line to the [indicatorEnd]
    path.lineTo(indicatorEnd, 0);
    // Paints a line from the [indicatorEnd] to the [indicatorHeight]
    path.lineTo(indicatorEnd , indicatorHeight);
    // Paints a line from the [indicatorHeight] to the [indicatorStart]
    path.lineTo(indicatorStart, indicatorHeight);
    
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    canvas.drawPath(getInnerPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}