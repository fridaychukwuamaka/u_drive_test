abstract class BaseUseCase<T> {
  const BaseUseCase();
}

abstract class AsyncUseCase<T, P> extends BaseUseCase<T> {
  const AsyncUseCase() : super();

  Future<T> call(P params);
}

abstract class NoParamsAsyncUseCase<T> extends BaseUseCase<T> {
  const NoParamsAsyncUseCase() : super();

  Future<T> call();
}

abstract class StreamUseCase<T, P> extends BaseUseCase<T> {
  const StreamUseCase() : super();

  Stream<T> call(P params);
}

abstract class NoParamsStreamUseCase<T> extends BaseUseCase<T> {
  const NoParamsStreamUseCase() : super();

  Stream<T> call();
}

abstract class UseCase<T, P> extends BaseUseCase<T> {
  const UseCase() : super();

  T call(P params);
}

abstract class NoParamsUseCase<T> extends BaseUseCase<T> {
  const NoParamsUseCase() : super();

  T call();
}
