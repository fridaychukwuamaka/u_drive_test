import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/navigation/app_router.dart';
import '../../../../../core/ui/themes/theme.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SizedBox(
        width: context.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 200,
              child: Image.asset(
                'assets/images/onboarding1.png',
                fit: BoxFit.fitWidth,
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
                    const SizedBox(height: 10),
                    Text(
                      'Make your way more comfortable',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.display4.copyWith(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Find the mechanic along the entire route without interrupting your route using this platform.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.body2.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () => context.pushNamed(RouteName.onboarding2),
                      child: SvgPicture.asset(
                        'assets/icons/progress_button.svg',
                        height: context.height * 0.115,
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
