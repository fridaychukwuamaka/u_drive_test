import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/auth_repository.dart';
import '../sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  final AuthDataSource remoteDataSource;

  @override
  Future<String> loginWithEmail(String email, String password) async {
    return remoteDataSource.loginWithEmail(email, password);
  }

  @override
  Future<String> registerWithEmail(String email, String password) async {
    return remoteDataSource.registerWithEmail(
      email,
      password,
    );
  }

  @override
  Future<void> logout() => remoteDataSource.logout();

  @override
  Stream<User?> get userAuthState => remoteDataSource.userAuthState;


}

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
  ),
);
