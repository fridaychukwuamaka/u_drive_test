part of 'extension.dart';

extension ContextExtension on BuildContext {
  /// get the width of the screen
  double get width => MediaQuery.sizeOf(this).width;

  /// get the height of the screen
  double get height => MediaQuery.sizeOf(this).height;
  double get bottom => MediaQuery.viewPaddingOf(this).bottom == 0
      ? AppStyle.appPaddingVal
      : MediaQuery.viewPaddingOf(this).bottom;

  double get top => MediaQuery.of(this).viewPadding.top == 0
      ? AppStyle.appPaddingVal
      : MediaQuery.viewPaddingOf(this).top;

  ThemeData get theme => Theme.of(this);

  double get appPaddingVal => width * 0.05;

  ColorScheme get colorScheme => theme.colorScheme;

  // run a function with a loading overlay
  Future<void> busy(Function() onCall) async {
    late OverlayEntry overlay;
    try {
      overlay = AppOverlay.showLoading(this);
      await onCall();
    } finally {
      AppOverlay.dismiss(overlay);
    }
  }
}
