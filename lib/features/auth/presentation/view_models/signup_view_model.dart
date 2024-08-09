import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/error.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/top_level_provider.dart';
import '../../../../core/ui/widgets/app_toast.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/usecases/register_with_email.dart';

class SignUpViewModel {
  SignUpViewModel(this._ref);

  final Ref _ref;

  late final logger = _ref.read(loggerProvider);

  final formKey = GlobalKey<FormState>();
  final emailTextCtrl = TextEditingController();
  final pwdTextCtrl = TextEditingController();
  final confirmPwdTextCtrl = TextEditingController();

  Future<void> signUp() async {
    try {
      if (formKey.currentState!.validate()) {
        final params = RegisterWithEmailParams(
          email: emailTextCtrl.text,
          password: pwdTextCtrl.text,
        );
        await _ref.read(registerWithEmailProvider)(params);
        AppToast.show('Signed up successfully');
      }
    } on Exception catch (e, s) {
      ExceptionHandler.debug(e, s);
      ExceptionHandler.show(e);
    }
  }

  String? confirmPwdValidator(String? value) {
    return InputValidation.confirmPassword(value, pwdTextCtrl.text);
  }

  void goToLogin() => _ref.read(appRouter).router.pushNamed(RouteName.login);
}

final signUpViewModelProvider =
    Provider.autoDispose<SignUpViewModel>(SignUpViewModel.new);
