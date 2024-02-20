import 'package:flutter/material.dart';
import 'package:scatter_chart/home_page.dart';
import 'package:scatter_chart/utils/routes.dart';

class ScatterChartApp extends StatelessWidget {
  const ScatterChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: Routes.routes,
    );
  }
}
