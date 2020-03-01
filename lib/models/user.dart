import 'package:bethriftytoday/models/currency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final Currency currency;

  User({
    this.uid,
    this.name,
    this.email,
    this.photoURL,
    this.currency,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromFirebaseUser(FirebaseUser user) => (user != null)
      ? User(
          uid: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoURL: user.photoUrl ?? '',
        )
      : null;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
