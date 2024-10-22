import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;

@immutable
class AuthUser {
  final bool isEmalVerified;

  const AuthUser(this.isEmalVerified);

  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
