import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pie_chart/widgets/first_pie_chart_widget.dart';

class FirstPieChartPage extends StatelessWidget {
  const FirstPieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: const AspectRatio(
        aspectRatio: 1,
        child: Column(
          children: [
            Gap(50),
            Text(
              'First Pie Chart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Gap(35),
            Expanded(
              child: FirstPieChartWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
