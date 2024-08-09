import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/extension.dart';
import '../../utils/utils.dart';
import '../themes/theme.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    required this.onPressed,
    this.buttonTitle,
    this.isLoadable = true,
    this.borderRadius = 108,
    this.width,
    this.disabled = false,
    this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
    ),
    super.key,
  });

  final String? buttonTitle;
  final Function() onPressed;
  final bool isLoadable;
  final double? width;
  final double borderRadius;
  final EdgeInsets padding;
  final bool disabled;
  final Widget? child;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextButton(
        onPressed: widget.disabled
            ? null
            : () async {
                hideKeyboard();
                if (widget.isLoadable) {
                  await context.busy(widget.onPressed);
                } else {
                  widget.onPressed();
                }
              },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: widget.padding,
          disabledForegroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          foregroundColor: context.colorScheme.onPrimary,
        ),
        child: widget.child ??
            Text(
              widget.buttonTitle!,
              style: AppTextStyle.body1.copyWith(
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
      ),
    );
  }
}

class AppOutlineButton extends StatefulWidget {
  const AppOutlineButton({
    required this.onPressed,
    this.child,
    super.key,
    this.buttonTitle,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
    ),
    this.color,
  });

  final String? buttonTitle;
  final Function() onPressed;

  final Widget? child;
  final EdgeInsets padding;
  final Color? color;

  @override
  State<AppOutlineButton> createState() => _AppOutlineButtonState();
}

class _AppOutlineButtonState extends State<AppOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        hideKeyboard();
        widget.onPressed();
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size.zero,
        foregroundColor: AppColors.secondary,
        backgroundColor: Colors.transparent, // button color
        side: BorderSide(
          color: widget.color ?? AppColors.secondary,
        ),
        padding: widget.padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(108),
        ),
      ),
      child: widget.child ??
          Text(
            widget.buttonTitle!,
            style: AppTextStyle.body1,
          ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.onPressed,
    required this.buttonTitle,
    required this.iconPath,
    super.key,
  });

  final Function() onPressed;
  final String buttonTitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return AppOutlineButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(width: 12),
          Text(
            buttonTitle,
            style: AppTextStyle.body1.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
