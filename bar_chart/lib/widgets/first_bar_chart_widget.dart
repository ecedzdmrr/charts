import 'dart:math';

import 'package:bar_chart/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FirstBarChartWidget extends StatefulWidget {
  const FirstBarChartWidget({
    super.key,
    required this.isPlaying,
  });

  final bool isPlaying;

  List<Color> get barColors => const <Color>[
        AppColors.blueGreen,
        AppColors.prussianBlue,
        AppColors.selectiveYellow,
        AppColors.utOrange,
        AppColors.fireEngineRed,
        AppColors.appleGreen,
      ];

  @override
  State<FirstBarChartWidget> createState() => _FirstBarChartWidgetState();
}

class _FirstBarChartWidgetState extends State<FirstBarChartWidget> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BarChart(
      widget.isPlaying ? secondData : firstData,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  BarChartData get firstData => BarChartData(
        borderData: borderData,
        gridData: gridData,
        titlesData: titlesData,
        barTouchData: firstBarTouchData,
        barGroups: firstBarGroups(),
      );

  BarChartData get secondData => BarChartData(
        borderData: borderData,
        gridData: gridData,
        titlesData: titlesData,
        barTouchData: secondBarTouchData,
        barGroups: secondBarGroups(),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  FlGridData get gridData => const FlGridData(
        show: false,
      );

  FlTitlesData get titlesData => FlTitlesData(
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: titlesWidget,
            reservedSize: 35,
          ),
        ),
      );

  Widget titlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text(
          'M',
          style: style,
        );
      case 1:
        text = const Text(
          'T',
          style: style,
        );
      case 2:
        text = const Text(
          'W',
          style: style,
        );
      case 3:
        text = const Text(
          'T',
          style: style,
        );
      case 4:
        text = const Text(
          'F',
          style: style,
        );
      case 5:
        text = const Text(
          'S',
          style: style,
        );
      case 6:
        text = const Text(
          'S',
          style: style,
        );
      default:
        text = const Text(
          '',
          style: style,
        );
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 15,
      child: text,
    );
  }

  // [firstData]

  BarTouchData get firstBarTouchData => BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: AppColors.bgColor.withOpacity(.5),
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      );

  BarChartGroupData firstGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? color,
    double width = 20,
    List<int> toolTips = const [],
  }) {
    color ??= AppColors.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          width: width,
          color: isTouched
              ? AppColors.barColor.withOpacity(.3)
              : AppColors.barColor,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: AppColors.bgColor,
          ),
        ),
      ],
      showingTooltipIndicators: toolTips,
    );
  }

  List<BarChartGroupData> firstBarGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return firstGroupData(0, 9, isTouched: i == touchedIndex);
          case 1:
            return firstGroupData(1, 6, isTouched: i == touchedIndex);
          case 2:
            return firstGroupData(2, 11, isTouched: i == touchedIndex);
          case 3:
            return firstGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return firstGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return firstGroupData(5, 13, isTouched: i == touchedIndex);
          case 6:
            return firstGroupData(6, 8.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  // [secondData]

  BarTouchData get secondBarTouchData => BarTouchData(
        enabled: false,
      );

  BarChartGroupData secondGroupData(
    int x,
    double y, {
    Color? color,
    double width = 20,
    List<int> toolTips = const [],
  }) {
    color ??= AppColors.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: width,
          color: widget.barColors[Random().nextInt(widget.barColors.length)],
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: AppColors.bgColor,
          ),
        ),
      ],
      showingTooltipIndicators: toolTips,
    );
  }

  List<BarChartGroupData> secondBarGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return secondGroupData(0, Random().nextInt(13).toDouble() + 7);
          case 1:
            return secondGroupData(1, Random().nextInt(13).toDouble() + 7);
          case 2:
            return secondGroupData(2, Random().nextInt(13).toDouble() + 7);
          case 3:
            return secondGroupData(3, Random().nextInt(13).toDouble() + 7);
          case 4:
            return secondGroupData(4, Random().nextInt(13).toDouble() + 7);
          case 5:
            return secondGroupData(5, Random().nextInt(13).toDouble() + 7);
          case 6:
            return secondGroupData(6, Random().nextInt(13).toDouble() + 7);
          default:
            return throw Error();
        }
      });
}
