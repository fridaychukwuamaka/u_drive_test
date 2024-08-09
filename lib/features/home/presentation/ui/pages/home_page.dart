import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/ui/themes/theme.dart';
import '../../view_models/home_view_model.dart';
import '../widgets/app_drawer.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const HomeAppBar(),
      drawer: const AppDrawer(),
      body: Consumer(
        builder: (context, ref, _) {
          final viewModel = ref.read(homeViewModel.notifier);
          final currentIndex = ref.watch(homeViewModel).currentIndex;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.pages[currentIndex]['page'],
          );
        },
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Consumer(
        builder: (context, ref, _) {
          final viewModel = ref.read(homeViewModel.notifier);
          final currentIndex = ref.watch(homeViewModel).currentIndex;
          return Text(
            viewModel.pages[currentIndex]['title'],
          );
        },
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.lightGrey,
          width: 0.5,
        ),
      ),
      actions: const [
        Badge(
          backgroundColor: AppColors.error,
          smallSize: 10,
          child: Icon(
            IconlyLight.notification,
            size: 30,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
