import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/navigation/app_router.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';

class SelectUserTypePage extends StatelessWidget {
  const SelectUserTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
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
                const SizedBox(width: 13),
                SvgPicture.asset(
                  'assets/icons/app_icon_text.svg',
                )
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
                const SizedBox(height: 30),
                Text(
                  '👋🏻  Hello',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.display4.copyWith(),
                ),
                const SizedBox(height: 8),
                Text(
                  'Choose how you will use the app for better experience',
                  style: AppTextStyle.body2.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                AppButton(
                  isLoadable: false,
                  width: double.infinity,
                  buttonTitle: "I'm a driver",
                  onPressed: () => context.pushNamed(RouteName.onboarding1),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: AppOutlineButton(
                    child: Text(
                      "I'm a mechanic",
                      style: AppTextStyle.body1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () => context.pushNamed(RouteName.onboarding1),
                  ),
                ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.pushNamed(RouteName.login),
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
    );
  }
}
