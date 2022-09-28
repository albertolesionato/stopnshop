import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../foundation.dart';
import '../widgets/future_builder_.dart';
import 'category_card.dart';

class Categories extends GoRouteData {
  const Categories();

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
