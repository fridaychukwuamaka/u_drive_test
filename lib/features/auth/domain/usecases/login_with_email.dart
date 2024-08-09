import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmail extends AsyncUseCase<String, LoginWithEmailParams> {
  LoginWithEmail(this.repository);

  final AuthRepository repository;

  @override
  Future<String> call(LoginWithEmailParams params) =>
      repository.loginWithEmail(params.email, params.password);
}

class LoginWithEmailParams extends Equatable {
  const LoginWithEmailParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

final loginWithEmailUsecase = Provider<LoginWithEmail>(
  (ref) => LoginWithEmail(ref.read(authRepositoryProvider)),
);
