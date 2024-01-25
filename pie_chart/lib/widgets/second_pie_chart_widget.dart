import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SecondPieChartWidget extends StatefulWidget {
  const SecondPieChartWidget({super.key});

  @override
  State<SecondPieChartWidget> createState() => _SecondPieChartWidgetState();
}

class _SecondPieChartWidgetState extends State<SecondPieChartWidget> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return PieChart(chartData);
  }

  PieChartData get chartData => PieChartData(
        borderData: borderData,
        pieTouchData: touchData,
        sectionsSpace: 0,
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
        final double fontSize = isTouched ? 20 : 16;
        final double radius = isTouched ? 110 : 100;
        final double widgetSize = isTouched ? 60 : 40;
        const shadows = [
          Shadow(color: Colors.black, blurRadius: 3),
        ];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xFF61A3BA),
              value: 40,
              title: '%40',
              radius: radius,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: shadows),
              badgeWidget: BadgeWidget(
                'assets/icons/chimney-sweep-svgrepo-com.png',
                size: widgetSize,
                borderColor: Colors.black54,
              ),
              badgePositionPercentageOffset: 1,
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xFFD2DE32),
              value: 25,
              title: '%25',
              radius: radius,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: shadows),
              badgeWidget: BadgeWidget(
                'assets/icons/director-svgrepo-com.png',
                size: widgetSize,
                borderColor: Colors.black54,
              ),
              badgePositionPercentageOffset: 1,
            );
          case 2:
            return PieChartSectionData(
              color: const Color(0xFFBEADFA),
              value: 15,
              title: '%15',
              radius: radius,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: shadows),
                  badgeWidget: BadgeWidget(
                'assets/icons/soldier-svgrepo-com.png',
                size: widgetSize,
                borderColor: Colors.black54,
              ),
              badgePositionPercentageOffset: 1,
            );
          case 3:
            return PieChartSectionData(
              color: const Color(0xFFE3AADD),
              value: 20,
              title: '%20',
              radius: radius,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: shadows),
                  badgeWidget: BadgeWidget(
                'assets/icons/dentist-svgrepo-com.png',
                size: widgetSize,
                borderColor: Colors.black54,
              ),
              badgePositionPercentageOffset: 1,
            );
          default:
            throw Error();
        }
      },
    );
  }
}

class BadgeWidget extends StatelessWidget {
  const BadgeWidget(
    this.asset, {
    required this.size,
    required this.borderColor,
    super.key,
  });
  final double size;
  final String asset;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image(
          image: AssetImage(asset),
        ),
      ),
    );
  }
}
