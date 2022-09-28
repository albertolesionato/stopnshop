import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../foundation.dart';
part 'category.g.dart';

@TypedGoRoute<Category>(
  path: 'category/:id',
)
class Category extends GoRouteData {
  const Category({required this.id});

  final String id;

  @override
  Page<void> buildPageWithState(BuildContext context, GoRouterState state) {
    // final page = GoRouter.of(context).location;

    return NoTransitionPage(
      child: Scaffold(
        body: Text('Category Page id = $id and the page is ?'),
      ),
    );
  }
}
// //
// class Category extends StatelessWidget {
//   const Category({super.key, required this.id, this.data});
//
//   final String id;
//   final StringMap? data;
//
//   @override
//   Widget build(BuildContext context) {
//     final page = GoRouter.of(context).location;
//
//     return Scaffold(
//       body: Text('Category Page id = $id and the page is $page'),
//     );
//   }
// }
