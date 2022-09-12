// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class FutureBuilder_<T> extends FutureBuilder<T> {
  FutureBuilder_(
      {super.key,
      required super.future,
      required Widget Function(BuildContext context, T data) builder})
      : super(builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'ERROR',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'NO DATA',
                style: TextStyle(color: Colors.red),
              ),
            );
          }


          return builder(context, snapshot.data as T);
        });

  static list<T>(
      {required Future<List<T>> future,
      required Widget Function(BuildContext context, T data) builder}) {
    return FutureBuilder_<List<T>>(
        future: future,
        builder: (context, data) {
          return ListView.separated(
              itemBuilder: (context, i) => builder(context, data[i]),
              separatorBuilder: (context, i) => const SizedBox(height: 15),
              itemCount: data.length);
        });
  }
}
