import 'dart:math' as math;

import 'package:bar_chart/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ThirdBarChartWidget extends StatefulWidget {
  const ThirdBarChartWidget({super.key});

  final shadowColor = const Color(0xFFCCCCCC);
  final colorList = const [
    _ColorData(AppColors.blueGreen, 18, 18),
    _ColorData(AppColors.prussianBlue, 20, 10),
    _ColorData(AppColors.selectiveYellow, 10, 13),
    _ColorData(AppColors.utOrange, 2.5, 2),
    _ColorData(AppColors.fireEngineRed, 2, 5),
    _ColorData(AppColors.appleGreen, 3, 3),
  ];

  @override
  State<ThirdBarChartWidget> createState() => _ThirdBarChartWidgetState();
}

class _ThirdBarChartWidgetState extends State<ThirdBarChartWidget> {
  BarChartGroupData generateBarGroupData(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 5,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: widget.shadowColor,
          width: 5,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BarChart(chartData);
  }

  BarChartData get chartData => BarChartData(
        // ?
        alignment: BarChartAlignment.spaceBetween,
        borderData: borderData,
        gridData: gridData,
        barTouchData: barTouchData,
        titlesData: titlesData,
        barGroups: widget.colorList.asMap().entries.map((e) {
          final index = e.key;
          final data = e.value;
          return generateBarGroupData(
            index,
            data.color,
            data.value,
            data.shadowValue,
          );
        }).toList(),
        maxY: 20,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColors.bgColor,
            width: 2,
          ),
        ),
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: AppColors.bgColor,
          strokeWidth: 2,
        ),
      );

  BarTouchData get barTouchData => BarTouchData(
      enabled: true,
      handleBuiltInTouches: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipMargin: 0,
        getTooltipItem: (BarChartGroupData group, int groupIndex,
            BarChartRodData rod, int rodIndex) {
          return BarTooltipItem(
            rod.toY.toString(),
            TextStyle(
              fontWeight: FontWeight.bold,
              color: rod.color,
              fontSize: 12,
              shadows: const [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 12,
                ),
              ],
            ),
          );
        },
      ),
      touchCallback: (event, response) {
        if (event.isInterestedForInteractions &&
            response != null &&
            response.spot != null) {
          setState(() {
            touchedGroupIndex = response.spot!.touchedBarGroupIndex;
          });
        } else {
          setState(() {
            touchedGroupIndex = -1;
          });
        }
      });

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          drawBelowEverything: true,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              );
            },
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: IconWidget(
                  color: widget.colorList[index].color,
                  isSelected: touchedGroupIndex == index,
                ),
              );
            },
          ),
        ),
      );
}

class IconWidget extends ImplicitlyAnimatedWidget {
  const IconWidget({
    super.key,
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      IconWidgetState();
}

class IconWidgetState extends AnimatedWidgetBaseState<IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.face_retouching_natural : Icons.face,
        color: widget.color,
        size: 25,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}

class _ColorData {
  const _ColorData(
    this.color,
    this.value,
    this.shadowValue,
  );
  final Color color;
  final double value;
  final double shadowValue;
}
