import 'package:flutter/material.dart';

import '../ui/widgets/app_loading.dart';

class AppOverlay {
  static void dismiss(OverlayEntry overlay) {
    overlay.remove();
  }

  static OverlayEntry showLoading(BuildContext context) {
    final overlay = Overlay.of(context);
    final OverlayEntry entry = OverlayEntry(builder: (_) {
      return Material(
        color: Colors.black.withOpacity(0.9),
        child: const AppLoading(),
      );
    });
    overlay.insert(entry);
    return entry;
  }
}
