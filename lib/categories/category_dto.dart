import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../foundation.dart';

part 'category_dto.g.dart';

@immutable
@JsonSerializable()
class CategoryDto extends Equatable {
  const CategoryDto({required this.id, required this.tags});

  factory CategoryDto.fromJson(StringMap json) => _$CategoryDtoFromJson(json);

  static Future<Widget> Function(Widget Function(List<CategoryDto>) builder)
      getCategories = (Widget Function(List<CategoryDto>) builder) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return builder([
      for (var record in [
        {
          'id': 'id1',
          'tags': ['drink', 'imported']
        },
        {'id': 'id2', 'tags': []}
      ])
        CategoryDto.fromJson(record)
    ]);
  };

  static Future<Widget> Function(
          String id, Widget Function(CategoryDto) builder) getCategory =
      (String id, Widget Function(CategoryDto) builder) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return builder(CategoryDto.fromJson(const {
      'id': 'id1',
      'tags': ['drink', 'imported']
    }));
  };

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'tags')
  final List<String> tags;

  StringMap toJson() => _$CategoryDtoToJson(this);

  @override
  List<Object> get props => [id, tags];

  @override
  String toString() => toJson().toString();
}
