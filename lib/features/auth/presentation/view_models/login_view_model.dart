import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/error.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/ui/widgets/app_toast.dart';
import '../../domain/usecases/login_with_email.dart';

class LoginViewModel {
  LoginViewModel(this._ref);

  final Ref _ref;


  final formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<void> login() async {
    try {
      if (formKey.currentState!.validate()) {
        final params = LoginWithEmailParams(
          email: emailTextController.text,
          password: passwordTextController.text,
        );
        await _ref.read(loginWithEmailUsecase)(params);
        AppToast.show('Logged in successfully');
      }
    } on Exception catch (e, s) {
      ExceptionHandler.debug(e, s);
      ExceptionHandler.show(e);
    }
  }

  void goToSignUp() => _ref.read(appRouter).router.pushNamed(RouteName.signUp);
}

final loginViewModelProvider =
    Provider.autoDispose<LoginViewModel>(LoginViewModel.new);
