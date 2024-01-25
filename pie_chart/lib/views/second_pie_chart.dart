import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pie_chart/widgets/second_pie_chart_widget.dart';

class SecondPieChartPage extends StatelessWidget {
  const SecondPieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: const AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Gap(50),
            Text(
              'Second Pie Chart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Gap(50),
            Expanded(
              child: SecondPieChartWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
