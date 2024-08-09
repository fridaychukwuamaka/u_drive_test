import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';
import '../../../../../core/ui/widgets/app_input.dart';
import '../../../../../core/utils/utils.dart';
import '../../view_models/login_view_model.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginViewModelProvider);
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: context.width * 0.133,
                    width: context.width * 0.133,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/icons/app_icon.svg',
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Welcome Back!',
                    style: AppTextStyle.display4.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please login first to start your Udrive',
                    style: AppTextStyle.body2.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(context.appPaddingVal),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  AppInput(
                    label: 'Email or phone number',
                    hint: 'Input your registered email or phone',
                    controller: viewModel.emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    validator: InputValidation.email,
                  ),
                  const SizedBox(height: 24),
                  AppInput(
                    label: 'Password',
                    hint: 'Input your password account',
                    obscureText: true,
                    controller: viewModel.passwordTextController,
                    textInputAction: TextInputAction.done,
                    validator: InputValidation.password,
                    onFieldSubmitted: (_) => context.busy(viewModel.login),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppCheckBoxTile(
                        onChanged: (value) {},
                        value: true,
                      ),
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          foregroundColor: AppColors.grey,
                          textStyle: AppTextStyle.body2.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Forgot password'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    width: double.infinity,
                    buttonTitle: 'Login',
                    onPressed: viewModel.login,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: SocialButton(
                          onPressed: () {},
                          buttonTitle: 'Google',
                          iconPath: 'assets/icons/google.svg',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SocialButton(
                          onPressed: () {},
                          buttonTitle: 'Apple',
                          iconPath: 'assets/icons/apple.svg',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                   Text.rich(
                    TextSpan(
                      text: 'New to udrive? ',
                      children: [
                        TextSpan(
                          text: 'Create Account',
                          recognizer: TapGestureRecognizer()
                            ..onTap = viewModel.goToSignUp,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppCheckBoxTile extends StatefulWidget {
  const AppCheckBoxTile({
    required this.onChanged,
    this.value,
    super.key,
  });

  final Function(bool?) onChanged;
  final bool? value;

  @override
  State<AppCheckBoxTile> createState() => _AppCheckBoxTileState();
}

class _AppCheckBoxTileState extends State<AppCheckBoxTile> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _value = !_value);
        widget.onChanged(_value);
      },
      child: Row(
        children: [
          Icon(
            IconlyBold.tick_square,
            color: widget.value ?? _value
                ? context.colorScheme.primary
                : AppColors.lightGrey,
          ),
          const SizedBox(width: 8),
          Text(
            'Remember me',
            style: AppTextStyle.body2.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
