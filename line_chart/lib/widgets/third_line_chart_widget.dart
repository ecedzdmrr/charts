import 'dart:async';
import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ThirdLineChartWidget extends StatefulWidget {
  const ThirdLineChartWidget({super.key});

  @override
  State<ThirdLineChartWidget> createState() => _ThirdLineChartWidgetState();
}

class _ThirdLineChartWidgetState extends State<ThirdLineChartWidget> {
  final limetCount = 100;
  final sinPoints = <FlSpot>[];
  final cosPoints = <FlSpot>[];

  double xValue = 0;
  double step = 0.05;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        while (sinPoints.length > limetCount) {
          sinPoints.removeAt(0);
          cosPoints.removeAt(0);
        }
        setState(() {
          sinPoints.add(FlSpot(xValue, math.sin(xValue)));
          cosPoints.add(FlSpot(xValue, math.cos(xValue)));
        });
        xValue += step;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return cosPoints.isNotEmpty
        ? Column(
            children: [
              const Gap(15),
              Text(
                'x: ${xValue.toStringAsFixed(1)}',
                style: const TextStyle(
                    color: Color(0xFFA9907E),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'sin: ${sinPoints.last.y.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Color(0xFFCD5C08),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'cos: ${cosPoints.last.y.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Color(0xFF5F6F52),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(15),
              AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: LineChart(chartData),
                ),
              ),
            ],
          )
        : Container();
  }

  LineChartData get chartData => LineChartData(
        lineTouchData: const LineTouchData(enabled: false),
        gridData: const FlGridData(
          show: true,
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(show: false),
        lineBarsData: [
          sinLine(sinPoints),
          cosLine(cosPoints),
        ],
        minY: -1,
        maxY: 1,
        minX: sinPoints.first.x,
        maxX: sinPoints.last.x,
      );

  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      isCurved: false,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [
          const Color(0xFFCD5C08).withOpacity(0),
          const Color(0xFFCD5C08),
        ],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      spots: points,
    );
  }

  LineChartBarData cosLine(List<FlSpot> points) {
    return LineChartBarData(
      isCurved: false,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [
          const Color(0xFF5F6F52).withOpacity(0),
          const Color(0xFF5F6F52),
        ],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      spots: points,
    );
  }
}
