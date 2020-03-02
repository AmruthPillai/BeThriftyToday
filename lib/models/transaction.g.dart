// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'timestamp': instance.timestamp?.toIso8601String(),
      'amount': instance.amount,
    };
