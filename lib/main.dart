import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:go_router/go_router.dart';
import 'package:stopnshop/categories/category_dto.dart';
import 'package:stopnshop/widgets/future_builder_.dart';

import 'account/login.dart';
import 'cart/cart.dart';
import 'categories/categories.dart';
import 'categories/category.dart';
import 'home/home.dart';
import 'shell.dart';
import 'state_observer.dart';

void main() {
  usePathUrlStrategy();
  Bloc.observer = StateObserver();
  runApp(const App());
}

final key = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final _router = GoRouter(
      // debugLogDiagnostics: true,
    redirect: (context, state) {
      print(state.location);

    },
      initialLocation: '/home',
      routes: [
        ShellRoute(
            builder: (context, state, child) {
              return Shell(key: state.pageKey, child: child);
            },
            routes: [
              // https://github.com/flutter/flutter/issues/99124
              GoRoute(
                  name: 'home',
                  path: '/:tab(home|cart|categories)',
                  pageBuilder: (context, state) {
                    int index;

                    switch (state.params['tab']!) {
                      case 'cart':
                        index = 1;
                        break;
                      case 'categories':
                        index = 2;
                        break;
                      case 'home':
                      default:
                        index = 0;
                    }
                    return NoTransitionPage(
                        child: IndexedStack(
                      index: index,
                      children: const [Home(), Cart(), Categories()],
                    ));
                  },
                  routes: [
                    GoRoute(
                        name: 'category',
                        path: 'category/:id',
                        pageBuilder: (context, state) {
                          if (state.extra == null) {
                            return NoTransitionPage(
                                child: FutureBuilder_.whole(
                                    future: CategoryDto.getCategory(
                                        state.params['id']!),
                                    builder: (context, json) {
                                      return Category(
                                          dto: CategoryDto.fromJson(json));
                                    }));
                          }
                          return NoTransitionPage(
                            child: Category(dto: state.extra as CategoryDto),
                          );
                        })
                  ]),
              GoRoute(
                  name: 'login',
                  path: '/login',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: Login(key: state.pageKey));
                  }),
            ])
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData.light().copyWith(
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 0, backgroundColor: Colors.white)),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
