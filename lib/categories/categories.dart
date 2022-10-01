import 'package:flutter/material.dart';
import 'package:stopnshop/categories/category_dto.dart';

import '../foundation.dart';
import '../widgets/future_widget.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @visibleForTesting
  static var getCategories = () async {
    await Future.delayed(const Duration(milliseconds: 250));
    return [
      {
        'id': 'id1',
        'tags': ['drink', 'imported']
      },
      {'id': 'id2', 'tags': []}
    ];
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureWidget.part(
        future: () async {
          return ListView(children: [
            for (var c in await getCategories()) CategoryCard.fromJson(c)
          ]);
        },
      ),
    ).safe();
  }
}
