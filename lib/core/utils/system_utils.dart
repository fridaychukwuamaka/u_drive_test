part of 'utils.dart';

/// Hides keyboard by finding the primary focused [FocusNode] or
/// [FocusScopeNode] then unfocus it. Take note that this triggers
/// [State.didChangeDependencies] on specific UIs which holds the node.
void hideKeyboard() {
  try {
    FocusManager.instance.primaryFocus?.unfocus();
  } on Exception catch (e) {
    debugPrint('Unable to unfocus $e');
  }
}
