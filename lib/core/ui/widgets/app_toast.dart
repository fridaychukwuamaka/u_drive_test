import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:toastification/toastification.dart';

import '../themes/theme.dart';

class AppToast {
  AppToast._();

  static void show(
    String message, {
    ToastType type = ToastType.success,
  }) {
    toastification.show(
      title: Text(
        '$message',
        style: AppTextStyle.body2.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: type == ToastType.info
          ? const Icon(FeatherIcons.info)
          : type == ToastType.success
              ? const Icon(FeatherIcons.checkCircle)
              : const Icon(FeatherIcons.alertCircle),
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 4),
      showProgressBar: false,
      // applyBlurEffect: true,
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withOpacity(0.05),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 5),
        ),
      ],
      primaryColor: type == ToastType.info
          ? AppColors.primary
          : type == ToastType.success
              ? AppColors.success
              : AppColors.error,
    );
  }
}

enum ToastType { info, success, error }
