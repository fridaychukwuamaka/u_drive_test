part of 'theme.dart';

class AppStyle {
  AppStyle._();

  static const double appPaddingVal = 24;

  static const dialogBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(AppStyle.appPaddingVal),
    topRight: Radius.circular(AppStyle.appPaddingVal),
  );

  static const modalDecoration = BoxDecoration(
    borderRadius: AppStyle.dialogBorderRadius,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 6),
      ),
    ],
  );
}
