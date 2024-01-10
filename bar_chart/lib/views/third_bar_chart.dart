import 'package:bar_chart/widgets/third_bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ThirdBarChartPage extends StatelessWidget {
  const ThirdBarChartPage({super.key});

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
              'Third Bar Chart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Gap(25),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ThirdBarChartWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
