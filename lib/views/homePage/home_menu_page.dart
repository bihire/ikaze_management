import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

// final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  Widget page;
  Widget menu;
  bool isCollapsed;
  MenuDashboardPage(
      {required this.menu, required this.page, required this.isCollapsed});
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  // late Animation<double> _scaleAnimation;
  // late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _slideAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void didUpdateWidget(covariant MenuDashboardPage oldWidget) {
    if (oldWidget.isCollapsed != widget.isCollapsed) {
      if (widget.isCollapsed == true)
        _controller.forward();
      else
        _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Material(
      child: Stack(
        children: <Widget>[
          dashboard(context, widget.page),
          menu(context, widget.menu),
        ],
      ),
    );
  }

  Widget menu(context, Widget child) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: 0,
      right: widget.isCollapsed ? -0.7 * screenWidth : 0,
      child: child,
    );
  }

  Widget dashboard(context, Widget child) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: widget.isCollapsed ? 0 : -0.7 * screenWidth,
      right: widget.isCollapsed ? 0 : 0.7 * screenWidth,
      child: Material(
        animationDuration: duration,
        elevation: 0,
        color: primaryLightColor,
        child: widget.page,
      ),
    );
  }
}
