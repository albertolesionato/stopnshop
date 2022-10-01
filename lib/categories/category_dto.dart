import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide WidgetBuilder;
import 'package:json_annotation/json_annotation.dart';
import '../foundation.dart';

part 'category_dto.g.dart';

@immutable
@JsonSerializable()
class CategoryDto extends Equatable {
  const CategoryDto({required this.id, required this.tags});

  factory CategoryDto.fromJson(StringMap json) => _$CategoryDtoFromJson(json);

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
