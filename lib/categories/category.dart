import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stopnshop/categories/category_dto.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.dto});

  final CategoryDto dto;

  @override
  Widget build(BuildContext context) {
    final page = GoRouter.of(context).location;

    return Scaffold(
      body: Text('Category Page id = ${dto.id} and the page is $page'),
    );
  }
}
