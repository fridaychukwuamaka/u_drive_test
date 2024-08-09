import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/domain/usecases/user_auth_state.dart';
import '../../features/auth/presentation/ui/pages/login_intro_page.dart';
import '../../features/auth/presentation/ui/pages/login_page.dart';
import '../../features/auth/presentation/ui/pages/signup_page.dart';
import '../../features/home/presentation/ui/pages/home_page.dart';
import '../../features/onboarding/presentation/ui/pages/onboarding_page_1.dart';
import '../../features/onboarding/presentation/ui/pages/onboarding_page_2.dart';
import '../../features/onboarding/presentation/ui/pages/select_user_type_page.dart';
import '../top_level_provider.dart';

part 'route_name.dart';

class AppRouter {
  AppRouter(
    this._ref, {
    this.isUserLoggedIn = false,
  }) {
    init();
  }

  final Ref _ref;
  final bool isUserLoggedIn;
  late GoRouter router;
  late final _logger = _ref.read(loggerProvider);

  void init() {
    try {
      router = GoRouter(
        initialLocation: '/home',
        routes: <RouteBase>[
          GoRoute(
            path: '/login',
            name: RouteName.login,
            builder: (context, state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            path: '/signUp',
            name: RouteName.signUp,
            builder: (context, state) {
              return const SignupPage();
            },
          ),
          GoRoute(
            path: '/loginIntro',
            name: RouteName.loginIntro,
            builder: (context, state) {
              return const LoginIntroPage();
            },
          ),
          GoRoute(
            path: '/selectUserType',
            name: RouteName.selectUserType,
            builder: (context, state) {
              return const SelectUserTypePage();
            },
          ),
          GoRoute(
            path: '/onboarding1',
            name: RouteName.onboarding1,
            builder: (context, state) {
              return const OnboardingPage1();
            },
          ),
          GoRoute(
            path: '/onboarding2',
            name: RouteName.onboarding2,
            builder: (context, state) {
              return const OnboardingPage2();
            },
          ),
          GoRoute(
            path: '/home',
            name: RouteName.home,
            redirect: _homeRedirect,
            builder: (context, state) {
              return const HomePage();
            },
          ),
        ],
      );
    } on Exception catch (e, s) {
      _logger.e('Error: $e', error: e, stackTrace: s);
    }
  }

  FutureOr<String?> _homeRedirect(BuildContext context, GoRouterState state) {
    final publicRoutes = ['/login', '/signUp'];
    try {
      if (isUserLoggedIn || publicRoutes.contains(state.fullPath)) {
        return null;
      } else {
        return '/selectUserType';
      }
    } on Exception catch (e, s) {
      _logger.e('Error: $e', error: e, stackTrace: s);
      return null;
    }
  }
}

final appRouter = Provider<AppRouter>(
  (ref) {
    final isUserLoggedIn = ref.watch(userAuthStateUsecase).valueOrNull != null;
    return AppRouter(
      ref,
      isUserLoggedIn: isUserLoggedIn,
    );
  },
);
