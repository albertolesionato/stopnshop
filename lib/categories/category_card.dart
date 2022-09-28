import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'category.dart';

import '../foundation.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.data});

  final StringMap data;

  @override
  Widget build(BuildContext context) {
    final page = GoRouter.of(context).location;
    return InkWell(
        onTap: () {
           //context.goNamed('category',
               //params: {'tab': 'categories', 'id': data['id']}, extra: data);
          const Category(id: '1').go(context);
          // context.go('/categories/category/1');
        },
        child:
            Card(child: Text('Category #${data['id']} and the page is $page')));
  }
}
