import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;

@immutable
class AuthUser {
  final bool isEmalVerified;

  const AuthUser({required this.isEmalVerified});

  factory AuthUser.fromFirebase(User user) =>
      AuthUser(isEmalVerified: user.emailVerified);
}
