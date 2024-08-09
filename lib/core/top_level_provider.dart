import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final loggerProvider = Provider(
  (_) => Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      dateTimeFormat: DateTimeFormat.onlyTime,
      colors: false,
    ),
  ),
);
