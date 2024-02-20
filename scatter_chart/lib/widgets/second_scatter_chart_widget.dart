import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scatter_chart/utils/colors.dart';

enum PainterType {
  circle,
  square,
  cross,
}

class SecondScatterChartWidget extends StatefulWidget {
  const SecondScatterChartWidget({super.key});

  @override
  State<SecondScatterChartWidget> createState() =>
      _SecondScatterChartWidgetState();
}

class _SecondScatterChartWidgetState extends State<SecondScatterChartWidget> {
  int touchedIndex = -1;

  List<int> selectedSpots = [];

  // [x,y and size]
  final spotsData = [
    (6.0, 4.0, 3.0),
    (2.0, 5.0, 9.0),
    (10.0, 10.0, 9.0),
    (10.0, 2.0, 13.0),
    (5.0, 7.0, 8.0),
    (7.0, 1.0, 10.0),
    (3.0, 2.0, 21.0),
    (2.0, 8.0, 13.0),
    (8.0, 8.0, 25.0),
    (12.0, 6.0, 20.0),
    (4.0, 11.0, 17.0),
  ];

  final _paintColors = [
    AppColors.yellow,
    AppColors.orange,
    AppColors.soft,
    AppColors.lilac,
    AppColors.purple,
    AppColors.turqoise,
    AppColors.skyMagenta,
    AppColors.appleGreen,
    AppColors.blue,
    AppColors.babyPink,
    AppColors.pink,
  ];

  PainterType _currentPaintType = PainterType.circle;

  static FlDotPainter _paint(PainterType type, double size, Color color) {
    switch (type) {
      case PainterType.circle:
        return FlDotCirclePainter(
          color: color,
          radius: size,
        );
      case PainterType.square:
        return FlDotSquarePainter(
          color: color,
          size: size,
          strokeWidth: 0,
        );
      case PainterType.cross:
        return FlDotCrossPainter(
          color: color,
          size: size * 1.5,
          width: (size / 5),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScatterChart(chartData),
        Align(
          alignment: Alignment.bottomRight,
          child: DropdownButton(
            value: _currentPaintType,
            items: PainterType.values
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (PainterType? value) {
              setState(() {
                _currentPaintType = value!;
              });
            },
          ),
        )
      ],
    );
  }

  ScatterChartData get chartData => ScatterChartData(
        gridData: gridData,
        borderData: borderData,
        titlesData: titlesData,
        showingTooltipIndicators: selectedSpots,
        scatterTouchData: touchData,
        scatterSpots: spotsData.asMap().entries.map((e) {
          final index = e.key;
          final (double x, double y, double size) = e.value;
          return ScatterSpot(
            x,
            y,
            dotPainter: _paint(
              _currentPaintType,
              size,
              selectedSpots.contains(index)
                  ? _paintColors[index % _paintColors.length]
                  : Colors.grey.shade300,
            ),
          );
        }).toList(),
        minX: 0,
        maxX: 13,
        minY: 0,
        maxY: 13,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        checkToShowHorizontalLine: (value) => true,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.grey.shade100,
        ),
        drawVerticalLine: true,
        checkToShowVerticalLine: (value) => true,
        getDrawingVerticalLine: (value) => FlLine(
          color: Colors.grey.shade100,
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  FlTitlesData get titlesData => const FlTitlesData(
        show: false,
      );

  ScatterTouchData get touchData => ScatterTouchData(
      enabled: true,
      handleBuiltInTouches: false,
      mouseCursorResolver:
          (FlTouchEvent touchEvent, ScatterTouchResponse? response) {
        return response == null || response.touchedSpot == null
            ? MouseCursor.defer
            : SystemMouseCursors.click;
      },
      touchTooltipData: ScatterTouchTooltipData(
        tooltipBgColor: Colors.black.withOpacity(.2),
        getTooltipItems: (ScatterSpot touchedSpot) {
          return ScatterTooltipItem(
            'x: ',
            textStyle: const TextStyle(
              height: 1.2,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bottomMargin: 3,
            children: [
              TextSpan(
                text: '${touchedSpot.x.toInt()} \n',
                style: const TextStyle(
                  height: 1.2,
                  color: Colors.white,
                ),
              ),
              const TextSpan(
                text: 'y: ',
                style: TextStyle(
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '${touchedSpot.y.toInt()}',
                style: const TextStyle(
                  height: 1.2,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
      touchCallback: (FlTouchEvent touchEvent, ScatterTouchResponse? response) {
        if (response == null || response.touchedSpot == null) {
          return;
        }
        if (touchEvent is FlTapUpEvent) {
          final sectionIndex = response.touchedSpot!.spotIndex;
          setState(() {
            if (selectedSpots.contains(sectionIndex)) {
              selectedSpots.remove(sectionIndex);
            } else {
              selectedSpots.add(sectionIndex);
            }
          });
        }
      });
}
