import 'package:flutter/material.dart';

// @TypedGoRoute<Login>(
//   path: '/login',
// )
// class Login extends GoRouteData {
//   const Login();
//
//   @override
//   Page<void> buildPageWithState(BuildContext context, GoRouterState state) {
//     return const NoTransitionPage(
//       child: Scaffold(
//         body: Center(
//           child: Text('Login Page'),
//         ),
//       ),
//     );
//   }
// }


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}
