import 'package:bar_chart/widgets/first_bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FirsBarChartPage extends StatefulWidget {
  const FirsBarChartPage({super.key});

  @override
  State<FirsBarChartPage> createState() => _FirsBarChartPageState();
}

class _FirsBarChartPageState extends State<FirsBarChartPage> {
  bool isPlaying = false;

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
                  'First Bar Chart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Gap(25),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FirstBarChartWidget(
                      isPlaying: isPlaying,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 25),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                      if (isPlaying) {
                        refreshState();
                      }
                    });
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 300),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
