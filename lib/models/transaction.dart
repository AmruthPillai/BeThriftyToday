import 'dart:convert';

import 'package:bethriftytoday/config/encrypt.dart';
import 'package:bethriftytoday/models/category.dart';

class Transaction {
  final String id;
  final Category category;
  final String description;
  final DateTime timestamp;
  final double amount;

  Transaction({
    this.id,
    this.category,
    this.description,
    this.timestamp,
    this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'] as String,
        category: Category.fromJson(jsonDecode(decrypt64(json['category']))),
        description: decrypt64(json['description']),
        timestamp: DateTime.parse(decrypt64(json['timestamp'])),
        amount: double.parse(decrypt64(json['amount'])),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'category': encrypt(jsonEncode(this.category)),
        'description': encrypt(this.description),
        'timestamp': encrypt(this.timestamp.toString()),
        'amount': encrypt(this.amount.toString()),
      };
}
