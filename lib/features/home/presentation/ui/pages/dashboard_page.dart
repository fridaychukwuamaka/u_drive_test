import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';
import '../widgets/summary_chart.dart';
import '../widgets/trip_summaries.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(context.appPaddingVal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const TripSummary(),
              const SizedBox(height: 24),
              AppOutlineButton(
                onPressed: () {},
                child: Text(
                  'View All Trips',
                  style: AppTextStyle.body2.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(context.appPaddingVal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Summary',
                      style: AppTextStyle.button.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(14, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                      ),
                    )
                  ],
                ),
              ),
              const SummaryChart(),
              const SizedBox(height: 24)
            ],
          ),
        ),
      ],
    );
  }
}
