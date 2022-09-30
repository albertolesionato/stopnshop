import 'package:flutter/material.dart';
import 'package:stopnshop/categories/category_dto.dart';

import '../foundation.dart';
import '../widgets/future_widget.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureWidget.part(
        future: CategoryDto.getCategories(CategoryCard.new, (children) {
          // return ListView.separated(
          //     itemBuilder: (context, i) => children[i],
          //     separatorBuilder: (context, i) => const SizedBox(height: 15),
          //     itemCount: children.length);
          return ListView(children: children);
        }),
      ),
    ).safe();
  }
}
