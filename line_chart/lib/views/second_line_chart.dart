import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_chart/widgets/second_line_chart_widget.dart';

class SecondLineChartPage extends StatelessWidget {
  const SecondLineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              Gap(50),
              Text(
                'Second Line Chart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(25),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 15),
                  child: SecondLineChartWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
