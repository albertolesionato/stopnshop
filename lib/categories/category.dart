import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'category_dto.dart';
import '../foundation.dart';

class Category extends StatelessWidget {
  const Category(this.dto, {super.key});

  Category.fromJson(StringMap json, {super.key})
      : dto = CategoryDto.fromJson(json);

  final CategoryDto dto;

  @override
  Widget build(BuildContext context) {
    final page = GoRouter.of(context).location;

    return Scaffold(
      body: Text('Category Page id = ${dto.id} and the page is $page'),
    );
  }
}
