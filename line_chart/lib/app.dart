import 'package:flutter/material.dart';
import 'package:line_chart/views/first_line_chart.dart';


class LineChartApp extends StatelessWidget {
  const LineChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstLineChartPage(),
    );
  }
}