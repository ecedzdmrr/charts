import 'package:bar_chart/home_page.dart';
import 'package:bar_chart/utils/routes.dart';
import 'package:flutter/material.dart';

class BarChartApp extends StatelessWidget {
  const BarChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: Routes.routes,
    );
  }
}
