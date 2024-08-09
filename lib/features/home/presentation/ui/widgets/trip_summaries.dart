import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/ui/themes/theme.dart';

class TripSummary extends StatelessWidget {
  const TripSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      children: [
        _summaryCard(
          title: 'My Trips In Progress',
          value: '1',
          icon: 'clock',
          colors: [
            const Color(0xFF3A9ADE),
            const Color(0xFF5EACE4),
          ],
        ),
        _summaryCard(
          title: 'My Trips Completed',
          value: '24',
          icon: 'verify',
          colors: [
            const Color(0xFF3F8B8D),
            const Color(0xFF58B2B4),
          ],
        ),
        _summaryCard(
          title: 'My Trips Cancelled',
          value: '5',
          icon: 'close-circle',
          colors: [
            const Color(0xFFDD4A4A),
            const Color(0xFFE87777),
          ],
        ),
      ],
    );
  }
}

Widget _summaryCard({
  required String title,
  required String value,
  required String icon,
  required List<Color> colors,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: colors,
        center: const Alignment(-0.5752, -0.5),
        radius: 0.7954,
      ),
      boxShadow: [
        BoxShadow(
            color: colors.last.withOpacity(0.80),
            blurRadius: 6,
            spreadRadius: 0.5,
            offset: const Offset(0, 3)),
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: AppTextStyle.title.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              'assets/icons/$icon.svg',
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyle.overline.copyWith(
            color: AppColors.white.withOpacity(0.8),
          ),
        ),
      ],
    ),
  );
}
