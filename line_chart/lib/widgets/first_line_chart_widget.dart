import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FirstLineChartWidget extends StatelessWidget {
  const FirstLineChartWidget({
    required this.showingData,
    super.key,
  });

  final bool showingData;
  @override
  Widget build(BuildContext context) {
    return LineChart(
      showingData ? firstData : secondData,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get firstData => LineChartData(
        gridData: gridData,
        borderData: borderData,
        titlesData: firstTitles,
        lineTouchData: firstLineTouchData,
        lineBarsData: firstLineBarsData,
        minX: 0,
        minY: 0,
        maxX: 7,
        maxY: 5,
      );

  LineChartData get secondData => LineChartData(
        gridData: gridData,
        borderData: borderData,
        titlesData: secondTitles,
        lineTouchData: secondLineTouchData,
        lineBarsData: secondLineBarsData,
        minX: 0,
        minY: 0,
        maxX: 5,
        maxY: 5,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          bottom: BorderSide(color: Colors.black87, width: 4),
        ),
      );

  Widget bottomTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toDouble()) {
      case 1:
        text = const Text(
          '1',
          style: style,
        );
        break;
      case 2:
        text = const Text(
          '2',
          style: style,
        );
        break;
      case 3:
        text = const Text(
          '3',
          style: style,
        );
        break;
      case 4:
        text = const Text(
          '4',
          style: style,
        );
        break;
      case 5:
        text = const Text(
          '5',
          style: style,
        );
        break;
      case 6:
        text = const Text(
          '6',
          style: style,
        );
        break;
      case 7:
        text = const Text(
          '7',
          style: style,
        );
        break;

      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: bottomTitlesWidget,
        reservedSize: 35,
        interval: 1,
      );

  Widget leftTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    String text;
    switch (value.toDouble()) {
      case 1:
        text = '100';
        break;
      case 2:
        text = '200';
        break;
      case 3:
        text = '300';
        break;
      case 4:
        text = '400';
        break;
      case 5:
        text = '500';
        break;

      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }

  SideTitles get leftTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: leftTitlesWidget,
        reservedSize: 50,
        interval: 1,
      );

  // [firstData]

  FlTitlesData get firstTitles => FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: leftTitles,
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
      );

  LineTouchData get firstLineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black.withOpacity(.5),
        ),
      );

  List<LineChartBarData> get firstLineBarsData => [
        firstLineBarsData1,
        firstLineBarsData2,
        firstLineBarsData3,
      ];

  LineChartBarData get firstLineBarsData1 => LineChartBarData(
        isCurved: true,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: const Color(0xFFA9907E),
        barWidth: 4,
        spots: const [
          FlSpot(1, 2),
          FlSpot(2, 5),
          FlSpot(3, 1),
          FlSpot(4, 4),
          FlSpot(5, 2),
          FlSpot(6, 5),
          FlSpot(7, 3),
        ],
      );

  LineChartBarData get firstLineBarsData2 => LineChartBarData(
        isCurved: true,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: const Color(0xFFCD5C08),
        barWidth: 4,
        spots: const [
          FlSpot(0, 0),
          FlSpot(0, 2),
          FlSpot(2, 4),
          FlSpot(3, 3),
          FlSpot(4, 4),
          FlSpot(5, 0),
          FlSpot(7, 2),
        ],
      );

  LineChartBarData get firstLineBarsData3 => LineChartBarData(
        isCurved: true,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: const Color(0xFF5F6F52),
        barWidth: 4,
        spots: const [
          FlSpot(0, 0),
          FlSpot(0, 1),
          FlSpot(1, 0),
          FlSpot(2, 3),
          FlSpot(3, 0),
          FlSpot(4, 1),
          FlSpot(7, 0),
        ],
      );

  // [secondData]

  FlTitlesData get secondTitles => FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: leftTitles,
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
      );

  LineTouchData get secondLineTouchData => const LineTouchData(
        enabled: false,
      );

  List<LineChartBarData> get secondLineBarsData => [
        secondLineBarsData1,
        secondLineBarsData2,
        secondLineBarsData3,
      ];

  LineChartBarData get secondLineBarsData1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        barWidth: 4,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
            show: true, color: const Color(0xFFA9907E).withOpacity(.2)),
        color: const Color(0xFFA9907E),
        spots: const [
          FlSpot(0, 0),
          FlSpot(0, 1),
          FlSpot(1, 2),
          FlSpot(2, 2),
          FlSpot(3, 3),
          FlSpot(5, 2),
        ],
      );

  LineChartBarData get secondLineBarsData2 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        barWidth: 4,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: const Color(0xFFCD5C08),
        spots: const [
          FlSpot(0, 2),
          FlSpot(1, 2),
          FlSpot(2, 1),
          FlSpot(3, 1),
          FlSpot(4, 4),
          FlSpot(5, 2),
        ],
      );

  LineChartBarData get secondLineBarsData3 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        barWidth: 4,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: const Color(0xFF5F6F52),
        spots: const [
          FlSpot(0, 4),
          FlSpot(1, 3),
          FlSpot(2, 3),
          FlSpot(2, 4),
          FlSpot(4, 3),
          FlSpot(5, 5),
        ],
      );
}
