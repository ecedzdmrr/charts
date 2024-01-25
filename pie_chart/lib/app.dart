import 'package:flutter/material.dart';
import 'package:pie_chart/home_page.dart';
import 'package:pie_chart/utils/routes.dart';

class PieChartApp extends StatelessWidget {
  const PieChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: Routes.routes,
    );
  }
}
