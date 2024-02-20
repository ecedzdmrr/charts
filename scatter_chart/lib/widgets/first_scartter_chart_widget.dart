import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scatter_chart/utils/colors.dart';

class FirstScatterChartWidget extends StatelessWidget {
  FirstScatterChartWidget({
    required this.showFlutter,
    super.key,
  });

  final double maxX = 50;
  final double maxY = 50;
  final double radius = 8;

  final blue = AppColors.flutterSky;
  final blueWOpacity = AppColors.flutterSky.withOpacity(0.5);

  final bool showFlutter;
  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      chartData,
      swapAnimationDuration: const Duration(milliseconds: 600),
      swapAnimationCurve: Curves.fastOutSlowIn,
    );
  }

  ScatterChartData get chartData => ScatterChartData(
        gridData: gridData,
        borderData: borderData,
        titlesData: titlesData,
        scatterTouchData: touchData,
        scatterSpots: showFlutter ? flutterLogo() : randomSpots(),
        minX: 0,
        maxX: maxX,
        minY: 0,
        maxY: maxY,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(show: false);

  FlTitlesData get titlesData => const FlTitlesData(show: false);

  ScatterTouchData get touchData => ScatterTouchData(enabled: false);

  List<ScatterSpot> flutterLogo() {
    return [
      // * 1st section
      ScatterSpot(
        20,
        14.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        22,
        16.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        24,
        18.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),

      // *
      ScatterSpot(
        22,
        12.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        24,
        14.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        26,
        16.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),

      // *
      ScatterSpot(
        24,
        10.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        26,
        12.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        28,
        14.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),

      // *
      ScatterSpot(
        26,
        8.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        28,
        10.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        30,
        12.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),

      // *
      ScatterSpot(
        28,
        6.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        30,
        8.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        32,
        10.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),

      // *
      ScatterSpot(
        30,
        4.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        32,
        6.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        34,
        8.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),

      // *
      ScatterSpot(
        34,
        4.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        36,
        6.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),
      ScatterSpot(
        38,
        4.5,
        dotPainter: FlDotCirclePainter(color: blueWOpacity, radius: radius),
      ),

      // * 2nd section
      ScatterSpot(
        20,
        14.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        22,
        12.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        24,
        10.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        22,
        16.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        24,
        14.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        26,
        12.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        24,
        18.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        26,
        16.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        28,
        14.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        26,
        20.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        28,
        18.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        30,
        16.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        28,
        22.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        30,
        20.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        32,
        18.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        30,
        24.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        32,
        22.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        34,
        20.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        34,
        24.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        36,
        22.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        38,
        24.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // * 3rd section
      ScatterSpot(
        10,
        24.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        12,
        22.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        14,
        20.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        12,
        26.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        14,
        24.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        16,
        22.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        14,
        28.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        16,
        26.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        18,
        24.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        16,
        30.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        18,
        28.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        20,
        26.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        18,
        32.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        20,
        30.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        22,
        28.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        20,
        34.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        22,
        32.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        24,
        30.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        22,
        36.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        24,
        34.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        26,
        32.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        24,
        38.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        26,
        36.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        28,
        34.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        26,
        40.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        28,
        38.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        30,
        36.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        28,
        42.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        30,
        40.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        32,
        38.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        30,
        44.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        32,
        42.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        34,
        40.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),

      // *
      ScatterSpot(
        34,
        44.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        36,
        42.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
      ScatterSpot(
        38,
        44.5,
        dotPainter: FlDotCirclePainter(color: blue, radius: radius),
      ),
    ];
  }

  List<ScatterSpot> randomSpots() {
    const blueCount = 57;
    const blueWOpacityCount = 21;
    return List.generate(blueCount + blueWOpacityCount, (i) {
      Color color;
      if (i < blueWOpacityCount) {
        color = blueWOpacity;
      } else {
        color = blue;
      }

      return ScatterSpot(
        (Random().nextDouble() * maxX),
        (Random().nextDouble() * maxY),
        dotPainter: FlDotCirclePainter(
          color: color,
          radius: (Random().nextDouble() * 16) + 4,
        ),
      );
    });
  }
}
