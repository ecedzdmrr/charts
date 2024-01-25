import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/widgets/indicator.dart';

class FirstPieChartWidget extends StatefulWidget {
  const FirstPieChartWidget({super.key});

  @override
  State<FirstPieChartWidget> createState() => _FirstPieChartWidgetState();
}

class _FirstPieChartWidgetState extends State<FirstPieChartWidget> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IndicatorWidget(
              color: const Color(0xFF61A3BA),
              text: 'One',
              isSquare: false,
              size: touchedIndex == 0 ? 24 : 16,
              textColor:
                  touchedIndex == 0 ? Colors.black : Colors.grey.shade600,
            ),
            IndicatorWidget(
              color: const Color(0xFFD2DE32),
              text: 'Two',
              isSquare: false,
              size: touchedIndex == 1 ? 24 : 16,
              textColor:
                  touchedIndex == 1 ? Colors.black : Colors.grey.shade600,
            ),
            IndicatorWidget(
              color: const Color(0xFFBEADFA),
              text: 'Three',
              isSquare: false,
              size: touchedIndex == 2 ? 24 : 16,
              textColor:
                  touchedIndex == 2 ? Colors.black : Colors.grey.shade600,
            ),
            IndicatorWidget(
              color: const Color(0xFFE3AADD),
              text: 'Four',
              isSquare: false,
              size: touchedIndex == 3 ? 24 : 16,
              textColor:
                  touchedIndex == 3 ? Colors.black : Colors.grey.shade600,
            ),
          ],
        ),
        Expanded(
          child: PieChart(chartData),
        ),
      ],
    );
  }

  PieChartData get chartData => PieChartData(
        borderData: borderData,
        pieTouchData: touchData,
        startDegreeOffset: 180,
        sectionsSpace: 1,
        centerSpaceRadius: 0,
        sections: showSections(),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  PieTouchData get touchData => PieTouchData(
        touchCallback: (FlTouchEvent event, touchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                touchResponse == null ||
                touchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = touchResponse.touchedSection!.touchedSectionIndex;
          });
        },
      );

  List<PieChartSectionData> showSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        const firstColor = Color(0xFF61A3BA);
        const secondColor = Color(0xFFD2DE32);
        const thirdColor = Color(0xFFBEADFA);
        const fourthColor = Color(0xFFE3AADD);
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: firstColor,
              value: 25,
              title: '',
              radius: 80,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                      color: Colors.white,
                      width: 4,
                    )
                  : const BorderSide(
                      color: Colors.transparent,
                    ),
            );
          case 1:
            return PieChartSectionData(
              color: secondColor,
              value: 25,
              title: '',
              radius: 65,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                      color: Colors.white,
                      width: 4,
                    )
                  : const BorderSide(
                      color: Colors.transparent,
                    ),
            );
          case 2:
            return PieChartSectionData(
              color: thirdColor,
              value: 25,
              title: '',
              radius: 60,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                      color: Colors.white,
                      width: 4,
                    )
                  : const BorderSide(
                      color: Colors.transparent,
                    ),
            );
          case 3:
            return PieChartSectionData(
              color: fourthColor,
              value: 25,
              title: '',
              radius: 70,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                      color: Colors.white,
                      width: 4,
                    )
                  : const BorderSide(
                      color: Colors.transparent,
                    ),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
