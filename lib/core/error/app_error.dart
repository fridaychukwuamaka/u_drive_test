part of 'error.dart';

class AppError implements Exception {
  final String msg;
  final String? code;

  AppError({
    required this.msg,
    this.code,
  });

  @override
  String toString() {
    return 'Code: $code, AppError: $msg';
  }

  String get errorMessage => msg;

  String get errorCode => code ?? 'unknown';

  String get errorMessageWithCode => '$errorCode: $msg';
}
