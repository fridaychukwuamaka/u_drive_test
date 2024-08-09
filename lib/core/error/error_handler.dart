part of 'error.dart';

class ExceptionHandler {
  static void debug(error, [StackTrace? stackTrace]) {
    if (error is Exception) {
      debugPrint('Exception: $error, stackTrace: $stackTrace');
    } else {
      debugPrint('Error: $error, stackTrace: $stackTrace');
    }
  }

  static String getErrorMsg(error) {
    if (error is FirebaseException) {
      debugPrint('FirebaseException: ${error.code}');
      switch (error.code) {
        case 'user-not-found':
          return 'User with this email does not exist';
        case 'email-already-in-use':
          return 'User with this email already exists';
        case 'network-request-failed':
        case 'deadline-exceeded':
          return 'No internet connection';
        case 'invalid-credential':
        case 'wrong-password':
          return 'Email or password is incorrect';
        case 'too-many-requests':
          return 'Too many attempts. Please try again later';
        default:
          return 'Sorry, something went wrong';
      }
    } else if (error is AppError) {
      return error.msg;
    } else if (error is Exception) {
      return error.toString().replaceAll('Exception: ', '');
    } else if (error is String) {
      return error;
    } else {
      return 'Something went wrong';
    }
  }

  static void show(error) {
    final message = getErrorMsg(error);
    AppToast.show(message, type: ToastType.error);
  }

  static Exception throwException(error) {
    if (error is FirebaseException) {
      throw Exception(error.message ?? 'Something went wrong');
    } else if (error is Exception) {
      throw error;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
