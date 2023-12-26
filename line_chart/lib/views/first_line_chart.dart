import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_chart/widgets/first_line_chart_widget.dart';

class FirstLineChartPage extends StatefulWidget {
  const FirstLineChartPage({super.key});

  @override
  State<FirstLineChartPage> createState() => _FirstLineChartPageState();
}

class _FirstLineChartPageState extends State<FirstLineChartPage> {
  late bool showingData;

  @override
  void initState() {
    super.initState();
    showingData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Column(
              children: [
                const Gap(50),
                const Text(
                  'First Line Chart',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(25),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FirstLineChartWidget(
                      showingData: showingData,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    showingData = !showingData;
                  });
                },
                icon: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
