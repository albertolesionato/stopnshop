import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';

import '../foundation.dart';
import 'navbar.dart';

class Nav extends StatelessWidget {
  const Nav({Key? key, required this.tab, required this.child})
      : super(key: key);

  static Nav of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<Nav>()!;

  final Widget child;
  final String tab;

  @override
  Widget build(BuildContext context) {
    if (Breakpoint.fromMediaQuery(context).window <= WindowSize.xsmall) {
      return Scaffold(
        appBar: AppBar(),
        body: child,
        bottomNavigationBar: Navbar(key: ValueKey(tab)),
      ).safe();
    }
    return SafeArea(
        child: Row(
      children: [
        Navbar(key: ValueKey(tab)),
        Expanded(child: Scaffold(appBar: AppBar(), body: child))
      ],
    ));
  }
}
