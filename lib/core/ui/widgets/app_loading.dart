import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../extensions/extension.dart';
import '../themes/theme.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: LoadingAnimationWidget.newtonCradle(
            color: AppColors.white,
            size: 60,
          )),
    );
  }
}
