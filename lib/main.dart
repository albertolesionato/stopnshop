import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'account/login.dart';
import 'cart/cart.dart';
import 'categories/categories.dart';
import 'categories/category.dart';
import 'foundation.dart';
import 'home/home.dart';
import 'nav/nav.dart';
import 'state_observer.dart';

void main() {
  Bloc.observer = StateObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final _router = GoRouter(
      // debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      initialLocation: '/home',
      routes: [
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
                    StringMap? data;
                    if (state.extra != null) {
                      data = state.extra as StringMap;
                    }
                    return NoTransitionPage(
                      child: Category(
                          key: state.pageKey,
                          id: state.params['id']!,
                          data: data),
                    );
                  })
            ]),
        GoRoute(
            path: '/login',
            pageBuilder: (context, state) {
              return NoTransitionPage(child: Login(key: state.pageKey));
            }),
      ],
      navigatorBuilder: (context, state, child) {
        print(state.name);
        // https://github.com/flutter/flutter/issues/110935
        return Nav(key: state.pageKey, tab: 'home', child: child);
      });

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
