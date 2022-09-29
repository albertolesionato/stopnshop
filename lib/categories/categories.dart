import 'package:flutter/material.dart';
import 'package:stopnshop/categories/category_dto.dart';

import '../foundation.dart';
import '../widgets/future_builder_.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder_.part(
            future: CategoryDto.getCategories(),
            builder: (context, json) {
              return ListView.separated(
                  itemBuilder: (context, i) =>
                      CategoryCard(dto: CategoryDto.fromJson(json[i])),
                  separatorBuilder: (context, i) => const SizedBox(height: 15),
                  itemCount: json.length);
            })).safe();
  }
}
