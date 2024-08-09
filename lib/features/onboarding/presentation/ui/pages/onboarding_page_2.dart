import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/navigation/app_router.dart';
import '../../../../../core/ui/themes/theme.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.appPaddingVal),
        child: Column(
          children: [
            SizedBox(
              height: context.top,
            ),
            Expanded(
              child: Image.asset(
                'assets/images/onboarding2.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Solution for drivers striving for successful work',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.display4.copyWith(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Be part of a new era of work with this innovative app',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.body2.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () => context.pushNamed(RouteName.loginIntro),
                  child: SvgPicture.asset('assets/icons/progress_button.svg'),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
