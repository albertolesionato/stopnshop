import 'package:flutter/material.dart';

import '../foundation.dart';
import '../widgets/future_builder_.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder_.list<StringMap>(future: () async {
      await Future.delayed(const Duration(milliseconds: 250));
      return [
        {
          'id': 'id1',
          'tags': ['drink', 'imported']
        },
        {'id': 'id2', 'tags': []}
      ];
    }(), builder: (context, data) {
      return CategoryCard(data: data);
    })).safe();
  }
}
