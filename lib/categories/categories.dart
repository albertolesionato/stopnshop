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
        // body: FutureWidget.part(
        //     future: CategoryDto.getCategories(),
        //     builder: (context, json) {
        //       return ListView.separated(
        //           itemBuilder: (context, i) =>
        //               CategoryCard(dto: CategoryDto.fromJson(json[i])),
        //           separatorBuilder: (context, i) => const SizedBox(height: 15),
        //           itemCount: json.length);
        //     })
        body: StreamBuilder<Widget>(
          stream: CategoryDto.getCategories(
              (dbt) {
                return Text(dbt.id);
              }
          ),
          builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          }
          return ListView(
            children: [snapshot.data!],
          );
        },),
    ).safe();
  }
}
