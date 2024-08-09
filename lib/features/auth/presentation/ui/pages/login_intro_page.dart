import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/navigation/app_router.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';

class LoginIntroPage extends StatelessWidget {
  const LoginIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 300,
              child: Image.asset(
                'assets/images/login_intro.jpeg',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
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
                    const SizedBox(height: 30),
                    Text(
                      'Your Successful\nJourney Starts Here',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.display4.copyWith(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Take your drive career to the next level with this  app.',
                      style: AppTextStyle.body2.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      width: double.infinity,
                      isLoadable: false,
                      buttonTitle: 'Login',
                      onPressed: () => context.pushNamed(RouteName.login),
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
                              ..onTap =
                                  () => context.pushNamed(RouteName.signUp),
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
            ),
          ],
        ),
      ),
    );
  }
}
