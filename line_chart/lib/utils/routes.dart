import 'package:flutter/material.dart';
import 'package:line_chart/home_page.dart';
import 'package:line_chart/views/first_line_chart.dart';
import 'package:line_chart/views/second_line_chart.dart';
import 'package:line_chart/views/third_line_chart.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String fistChart = '/firstChart';
  static const String secondChart = '/secondChart';
  static const String thirdChart = '/thirdChart';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomePage(),
    fistChart: (BuildContext context) => const FirstLineChartPage(),
    secondChart: (BuildContext context) => const SecondLineChartPage(),
    thirdChart: (BuildContext context) => const ThirdLineChartPage(),
  };
}
