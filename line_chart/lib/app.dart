import 'package:flutter/material.dart';
import 'package:line_chart/utils/routes.dart';
import 'package:line_chart/views/home_page.dart';

class LineChartApp extends StatelessWidget {
  const LineChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: Routes.routes,
    );
  }
}
