import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'nav.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Breakpoint.fromMediaQuery(context).window == WindowSize.xsmall) {
      final tabWidth = MediaQuery.of(context).size.width / 3;
      return IntrinsicHeight(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ColoredBox(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: tabWidth,
                    child: const NavbarTab(
                        iconData: Icons.home_filled, label: 'Home'),
                  ),
                  SizedBox(
                    width: tabWidth,
                    child: const NavbarTab(
                        iconData: Icons.shopping_cart, label: 'Cart'),
                  ),
                  SizedBox(
                    width: tabWidth,
                    child: const NavbarTab(
                        iconData: Icons.category, label: 'Categories'),
                  )
                ],
              )),
        ),
      );
    }

    // Cannot have elevation and CrossAxisAlignment.stretch
    // https://github.com/flutter/flutter/issues/12206
    // https://github.com/flutter/flutter/issues/22954

    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(
        width: 100,
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    NavbarTab(iconData: Icons.home_filled, label: 'Home'),
                    NavbarTab(iconData: Icons.shopping_cart, label: 'Cart'),
                    NavbarTab(iconData: Icons.category, label: 'Categories')
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class NavbarTab extends StatelessWidget {
  const NavbarTab({super.key, required this.iconData, required this.label});

  final IconData iconData;
  final String label;

  String get value => label.toLowerCase();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).scaffoldBackgroundColor;
    final tab = Nav.of(context).tab;

    return Material(
      color: tab == value ? color : Colors.white,
      child: InkWell(
        hoverColor: color,
        onTap: () => context.goNamed('home', params: {'tab': value}),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [Icon(iconData), const SizedBox(height: 5), Text(label)],
          ),
        ),
      ),
    );
  }
}
