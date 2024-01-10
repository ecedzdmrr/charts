import 'package:bar_chart/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SecondBarChartWidget extends StatelessWidget {
  const SecondBarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(chartData);
  }

  BarChartData get chartData => BarChartData(
        alignment: BarChartAlignment.spaceAround,
        borderData: borderData,
        gridData: gridData,
        barTouchData: barTouchData,
        titlesData: titlesData,
        barGroups: barGroups,
        maxY: 20,
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  FlGridData get gridData => const FlGridData(
        show: false,
      );

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 10,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                fontSize: 12,
                color: AppColors.blueGreen,
              ),
            );
          },
        ),
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
      color: AppColors.prussianBlue,
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

  LinearGradient get barsGradient => const LinearGradient(
        colors: [AppColors.prussianBlue, AppColors.blueGreen],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 9,
              gradient: barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 13,
              gradient: barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 3,
              gradient: barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 4,
              gradient: barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 19,
              gradient: barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: 9,
              gradient: barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
