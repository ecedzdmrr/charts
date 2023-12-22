import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_chart/utils/routes.dart';
import 'package:line_chart/widgets/third_line_chart_widget.dart';

class ThirdLineChartPage extends StatelessWidget {
  const ThirdLineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.home);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
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
