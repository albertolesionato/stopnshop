import 'package:flutter/material.dart';

import '../foundation.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Card(
                child: Text('Product Name'),
              );
            })).safe();
  }
}