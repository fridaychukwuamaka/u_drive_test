import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

class Logout extends NoParamsAsyncUseCase<void> {
  Logout(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call() => repository.logout();
}

final logoutUsecase = Provider<Logout>(
  (ref) => Logout(ref.read(authRepositoryProvider)),
);
