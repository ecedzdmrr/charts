import 'package:flutter/material.dart';
import 'package:line_chart/views/first_line_chart.dart';

class Routes {
  Routes._();

  static const String fistChart = '/firstChart';

  static final routes = <String, WidgetBuilder>{
    fistChart: (BuildContext context) => const FirstLineChartPage(),
  };
}
