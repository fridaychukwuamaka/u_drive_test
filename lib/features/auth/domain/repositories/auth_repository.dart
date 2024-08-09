import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<String> loginWithEmail(String email, String password);
  Future<String> registerWithEmail(String email, String password);
  Future<void> logout();
  Stream<User?> get userAuthState;
}
