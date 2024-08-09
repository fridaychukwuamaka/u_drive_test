import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/navigation/app_router.dart';
import '../core/ui/themes/theme.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(appRouter);
    return MaterialApp.router(
      routerConfig: ref.read(appRouter).router,
      theme: AppThemes.light,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
