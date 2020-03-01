// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    category: json['category'] as String,
    description: json['description'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    amount: (json['amount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'timestamp': instance.timestamp?.toIso8601String(),
      'amount': instance.amount,
    };
