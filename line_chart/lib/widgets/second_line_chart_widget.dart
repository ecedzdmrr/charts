import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class SecondLineChartWidget extends StatelessWidget {
  const SecondLineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(chartData);
  }

  LineChartData get chartData => LineChartData(
        gridData: gridData,
        borderData: borderData,
        lineTouchData: lineTouchData,
        lineBarsData: lineBarsData,
        titlesData: titlesData,
        betweenBarsData: [
          BetweenBarsData(
            fromIndex: 0,
            toIndex: 1,
            color: const Color(0xFFA9907E).withOpacity(.3),
          ),
        ],
        minY: 0,
        maxY: 8,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        checkToShowHorizontalLine: (double value) {
          return value == 1 || value == 3 || value == 5 || value == 7;
        },
      );

  FlBorderData get borderData => FlBorderData(show: false);

  LineTouchData get lineTouchData => const LineTouchData(
        enabled: false,
      );

  List<LineChartBarData> get lineBarsData => [
        firstLineBars,
        secondLineBars,
      ];

  LineChartBarData get firstLineBars => LineChartBarData(
        isCurved: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: const Color(0xFF5F6F52),
        barWidth: 3,
        spots: const [
          FlSpot(0, 4),
          FlSpot(1, 3),
          FlSpot(2, 5),
          FlSpot(3, 1),
          FlSpot(4, 3),
          FlSpot(5, 6),
          FlSpot(6, 6),
          FlSpot(7, 6),
          FlSpot(8, 4),
          FlSpot(9, 8),
          FlSpot(10, 3),
          FlSpot(11, 6),
        ],
      );

  LineChartBarData get secondLineBars => LineChartBarData(
        isCurved: false,
        dotData: const FlDotData(show: false),
        color: const Color(0xFFCD5C08),
        barWidth: 3,
        spots: const [
          FlSpot(0, 7),
          FlSpot(1, 2),
          FlSpot(2, 4),
          FlSpot(3, 2),
          FlSpot(4, 3),
          FlSpot(5, 4),
          FlSpot(6, 5),
          FlSpot(7, 3),
          FlSpot(8, 1),
          FlSpot(9, 5),
          FlSpot(10, 4),
          FlSpot(11, 6),
        ],
      );

  FlTitlesData get titlesData => FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitlesWidget,
            interval: 1,
            reservedSize: 30,
          ),
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
            interval: 1,
            getTitlesWidget: bottomTitlesWidget,
          ),
        ),
      );

  Widget leftTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        value.toStringAsFixed(0),
        style: style,
      ),
    );
  }

  Widget bottomTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 3,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
