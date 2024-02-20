import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scatter_chart/widgets/first_scartter_chart_widget.dart';

class FirstScatterChartPage extends StatefulWidget {
  const FirstScatterChartPage({super.key});

  @override
  State<FirstScatterChartPage> createState() => _FirstScatterChartPageState();
}

class _FirstScatterChartPageState extends State<FirstScatterChartPage> {
  bool showFlutter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            showFlutter = !showFlutter;
          });
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              const Gap(50),
              const Text(
                'First Scatter Chart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(25),
              Expanded(
                child: FirstScatterChartWidget(
                  showFlutter: showFlutter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
