import 'package:flutter/material.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';

class SummaryChart extends StatefulWidget {
  const SummaryChart({
    super.key,
  });

  @override
  State<SummaryChart> createState() => _SummaryChartState();
}

class _SummaryChartState extends State<SummaryChart>
    with SingleTickerProviderStateMixin {
  int? selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: context.height * 0.28,
          padding: EdgeInsets.only(right: context.appPaddingVal),
          width: constraints.maxWidth,
          child: Column(
            children: [
              // const SizedBox(height: 36),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: context.appPaddingVal),
                  child: Row(
                    children: List.generate(
                      productivityData.length,
                      (i) => ChartBarItem(
                        selected: selectedIndex == i,
                        value: productivityData[i],
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> productivityData = [
    {
      'value': 0.8,
      'xLabel': 'Jan',
    },
    {
      'value': 0.4,
      'xLabel': 'Feb',
    },
    {
      'value': 1,
      'xLabel': 'Mar',
    },
    {
      'value': 0.7,
      'xLabel': 'Apr',
    },
    {
      'value': 0.8,
      'xLabel': 'May',
    },
    {
      'value': 0.6,
      'xLabel': 'Jun',
    },
    {
      'value': 0.9,
      'xLabel': 'Jul',
    },
    {
      'value': 0.7,
      'xLabel': 'Aug',
    },
    {
      'value': 0.8,
      'xLabel': 'Sep',
    },
    {
      'value': 0.6,
      'xLabel': 'Oct',
    },
    {
      'value': 0.9,
      'xLabel': 'Nov',
    },
    {
      'value': 0.7,
      'xLabel': 'Dec',
    },
  ];
}

class ChartBarItem extends StatelessWidget {
  const ChartBarItem({
    required this.onTap,
    required this.value,
    this.selected = false,
    super.key,
  });

  final bool selected;
  final Function() onTap;
  final Map<String, dynamic> value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (selected)
            Column(
              children: [
                Container(
                  height: 37,
                  width: (context.width * 0.14) + 8,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '${(value['value'] * 100).toInt()} %',
                      style: AppTextStyle.body1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                // triangle
                Transform.translate(
                  offset: const Offset(0, -0.5),
                  child: Container(
                    width: 20,
                    height: 5,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 10,
                          color: Colors.transparent,
                        ),
                        right: BorderSide(
                          width: 10,
                          color: Colors.transparent,
                        ),
                        top: BorderSide(
                          width: 8,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          else
            Container(
              width: (context.width * 0.13) + 10,
            ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onTap,
                child: AnimatedContainer(
                  height: (constraints.maxHeight - 94) * value['value'],
                  duration: const Duration(milliseconds: 300),
                  width: context.width * 0.13,
                  decoration: BoxDecoration(
                    gradient: selected
                        ? const LinearGradient(
                            colors: [
                              AppColors.secondary,
                              AppColors.secondary,
                            ],
                            stops: [-0.0809, 1.0882],
                          )
                        : LinearGradient(
                            colors: [
                              AppColors.secondary.withOpacity(0.12),
                              AppColors.secondary.withOpacity(0.06),
                            ],
                            stops: const [-0.0809, 1.0882],
                          ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  value['xLabel'],
                  style: AppTextStyle.body2.copyWith(
                    color: selected ? AppColors.secondary : AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
