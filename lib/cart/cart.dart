import 'package:flutter/material.dart';
import '../foundation.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Text('Product id $index'),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Add to cart'))
                  ],
                ),
              );
            })).safe();
  }
}
