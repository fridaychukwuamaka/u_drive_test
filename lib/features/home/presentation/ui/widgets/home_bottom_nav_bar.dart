import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/ui/themes/theme.dart';
import '../../view_models/home_view_model.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final viewModel = ref.read(homeViewModel.notifier);
          final state = ref.watch(homeViewModel).currentIndex;

          return BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: state,
            onTap: viewModel.goTo,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.lightGrey,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  state == 0 ? IconlyBold.category : IconlyLight.category,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  state == 1 ? IconlyBold.folder : IconlyLight.folder,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  state == 2 ? IconlyBold.calendar : IconlyLight.calendar,
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  state == 3 ? IconlyBold.profile : IconlyLight.profile,
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
