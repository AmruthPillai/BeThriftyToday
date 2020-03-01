import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final String category;
  final String description;
  final DateTime timestamp;
  final double amount;

  Transaction({
    this.category,
    this.description,
    this.timestamp,
    this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
