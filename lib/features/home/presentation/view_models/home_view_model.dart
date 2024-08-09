import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/error.dart';
import '../../../../core/ui/widgets/app_toast.dart';
import '../../../auth/domain/usecases/logout.dart';
import '../states/home_state/home_state.dart';
import '../ui/pages/dashboard_page.dart';

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() => const HomeState();

  void goTo(int index) {
    state = state.copyWith(currentIndex: index);
  }

  List<Map<String, dynamic>> pages = [
    {
      'title': 'Dashboard',
      'page': const DashboardPage(),
    },
    {
      'title': 'Dashboard',
      'page': const DashboardPage(),
    },
    {
      'title': 'Dashboard',
      'page': const DashboardPage(),
    },
    {
      'title': 'Profile',
      'page': const DashboardPage(),
    },
  ];

  Future<void> logout() async {
    try {
      await ref.read(logoutUsecase)();
      AppToast.show('Logged out successfully');
    } on Exception catch (e, s) {
      ExceptionHandler.debug(e, s);
      ExceptionHandler.show(e);
    }
  }
}

final homeViewModel =
    NotifierProvider<HomeViewModel, HomeState>(HomeViewModel.new);
