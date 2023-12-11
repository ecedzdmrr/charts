import 'package:flutter/material.dart';
import 'package:line_chart/views/first_line_chart.dart';
import 'package:line_chart/views/second_line_chart.dart';

class Routes {
  Routes._();

  static const String fistChart = '/firstChart';
  static const String secondChart = '/secondChart';

  static final routes = <String, WidgetBuilder>{
    fistChart: (BuildContext context) => const FirstLineChartPage(),
    secondChart: (BuildContext context) => const SecondLineChartPage(),
  };
}
