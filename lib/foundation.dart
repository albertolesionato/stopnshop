
import 'package:flutter/material.dart';

typedef StringMap<T> = Map<String, T>;

extension SafeScaffold on Scaffold {
  SafeArea safe() => SafeArea(child: this);
}