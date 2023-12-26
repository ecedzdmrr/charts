import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_chart/widgets/third_line_chart_widget.dart';

class ThirdLineChartPage extends StatelessWidget {
  const ThirdLineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: const Column(
        children: [
          Gap(50),
          Text(
            'Third Line Chart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(25),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ThirdLineChartWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
