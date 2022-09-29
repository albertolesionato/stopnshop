import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'foundation.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key, required this.child}) : super(key: key);

  static Shell of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<Shell>()!;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Breakpoint.fromMediaQuery(context).window <= WindowSize.xsmall) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => context.goNamed('login'),
                icon: const Icon(Icons.login, color: Colors.blue))
          ],
        ),
        body: child,
        bottomNavigationBar: const _Navbar(),
      ).safe();
    }
    return SafeArea(
        child: Row(
      children: [
        const _Navbar(),
        Expanded(
            child: Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                        onPressed: () => context.goNamed('login'),
                        icon: const Icon(Icons.login, color: Colors.blue))
                  ],
                ),
                body: child))
      ],
    ));
  }
}

class _Navbar extends StatefulWidget {
  const _Navbar({Key? key}) : super(key: key);

  @override
  State<_Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<_Navbar> {
  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(context).location;

    tab(IconData iconData, String label) {
      final color = Theme.of(context).scaffoldBackgroundColor;
      final value = label.toLowerCase();

      return Material(
        color: currentLocation.substring(1) == value ? color : Colors.white,
        child: InkWell(
          hoverColor: color,
          onTap: () {
            context.goNamed('home', params: {'tab': value});
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Icon(iconData),
                const SizedBox(height: 5),
                Text(label)
              ],
            ),
          ),
        ),
      );
    }

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
                    child: tab(Icons.home_filled, 'Home'),
                  ),
                  SizedBox(
                    width: tabWidth,
                    child: tab(Icons.shopping_cart, 'Cart'),
                  ),
                  SizedBox(
                    width: tabWidth,
                    child: tab(Icons.category, 'Categories'),
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
                  children: [
                    tab(Icons.home_filled, 'Home'),
                    tab(Icons.shopping_cart, 'Cart'),
                    tab(Icons.category, 'Categories')
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
