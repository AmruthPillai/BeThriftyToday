// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    icon: json['icon'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'icon': instance.icon,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };
