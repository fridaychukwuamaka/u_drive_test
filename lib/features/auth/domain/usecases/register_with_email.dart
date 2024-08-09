import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

class RegisterWithEmail extends AsyncUseCase<String, RegisterWithEmailParams> {
  RegisterWithEmail(this.repository);

  final AuthRepository repository;

  @override
  Future<String> call(RegisterWithEmailParams params) =>
      repository.registerWithEmail(params.email, params.password);
}

class RegisterWithEmailParams extends Equatable {
  const RegisterWithEmailParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

final registerWithEmailProvider = Provider<RegisterWithEmail>(
  (ref) => RegisterWithEmail(ref.read(authRepositoryProvider)),
);
