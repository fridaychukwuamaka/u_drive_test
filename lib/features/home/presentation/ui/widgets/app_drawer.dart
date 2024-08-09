import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/async_builder.dart';
import '../../../../auth/domain/usecases/user_auth_state.dart';
import '../../view_models/home_view_model.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeViewModel.notifier);
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            AsyncDataBuilder(userAuthStateUsecase, onData: (user) {
              return ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.lightGrey,
                  child: Icon(
                    FeatherIcons.user,
                    size: 20,
                  ),
                ),
                title: Text(
                  user?.displayName ?? 'Welcome',
                  style: AppTextStyle.body1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  user?.email ?? 'No email',
                  style: AppTextStyle.body3.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }),
            const Spacer(),
            ListTile(
              leading: const Icon(
                FeatherIcons.logOut,
              ),
              onTap: viewModel.logout,
              title: Text(
                'Logout',
                style: AppTextStyle.body2.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
