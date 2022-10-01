import 'package:flutter/material.dart';

typedef StringMap<T> = Map<String, T>;
// typedef WidgetBuilder<T> = Widget Function(T);

extension SafeScaffold on Scaffold {
  SafeArea safe() => SafeArea(child: this);
}
