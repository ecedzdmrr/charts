import 'package:flutter/material.dart';
import 'package:scatter_chart/home_page.dart';
import 'package:scatter_chart/views/first_scatter_chart.dart';
import 'package:scatter_chart/views/second_scatter_chart.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String firstChart = '/firstChart';
  static const String secondChart = '/secondChart';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomePage(),
    firstChart: (BuildContext context) => const FirstScatterChartPage(),
    secondChart: (BuildContext context) => const SecondScatterChartPage(),
  };
}
