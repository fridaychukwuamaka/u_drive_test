import 'package:flutter/material.dart';

import '../../extensions/extension.dart';

Future<T?> showAppBottomModal<T>(BuildContext context, Widget child) async {
  return Navigator.of(context).push<T?>(
    PageRouteBuilder(
      fullscreenDialog: true,
      pageBuilder: (context, animation, secondaryAnimation) => Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: context.colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - context.top,
              minHeight: 10,
            ),
            child: child,
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.8),
      barrierDismissible: true,
      opaque: false,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
