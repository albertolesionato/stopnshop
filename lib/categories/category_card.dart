import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stopnshop/categories/category_dto.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.dto, {super.key});

  final CategoryDto dto;

  @override
  Widget build(BuildContext context) {
    final page = GoRouter.of(context).location;
    return InkWell(
        onTap: () {
          context.goNamed('category',
              params: {'tab': 'categories', 'id': dto.id}, extra: dto);
        },
        child:
            Card(child: Text('Category #${dto.id} and the page is $page')));
  }
}
