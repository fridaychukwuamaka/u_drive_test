import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

class UserAuthState extends NoParamsStreamUseCase<User?> {
  UserAuthState(this.repository);

  final AuthRepository repository;

  @override
  Stream<User?> call() => repository.userAuthState;
}

final userAuthStateUsecase = StreamProvider<User?>(
    (ref) => ref.read(authRepositoryProvider).userAuthState);
