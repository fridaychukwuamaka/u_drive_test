import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/top_level_provider.dart';

abstract class AuthDataSource {
  Future<String> loginWithEmail(String email, String password);
  Future<String> registerWithEmail(String email, String password);
  Future<void> logout();
  Stream<User?> get userAuthState;
}

class AuthRemoteDataSourceImpl implements AuthDataSource {
  const AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
  });

  final FirebaseAuth firebaseAuth;

  @override
  Future<String> loginWithEmail(String email, String password) async {
    try {
      // login with email and password
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      // get user document from firestore
      if (user != null) {
        return user.uid;
      } else {
        throw Exception('User not found');
      }
    } on FirebaseAuthException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<String> registerWithEmail(String email, String password) async {
    try {
      // register with email and password
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      // create user document in firestore
      if (user != null) {
        return user.uid;
      } else {
        throw Exception('User not found');
      }
    } on FirebaseAuthException {
      await firebaseAuth.signOut();
      rethrow;
    } on Exception {
      await firebaseAuth.signOut();
      rethrow;
    }
  }

  @override
  Future<void> logout() => firebaseAuth.signOut();

  @override
  Stream<User?> get userAuthState => firebaseAuth.userChanges();
}

final authRemoteDataSourceProvider = Provider<AuthDataSource>((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider);

  return AuthRemoteDataSourceImpl(
    firebaseAuth: firebaseAuth,
  );
});
