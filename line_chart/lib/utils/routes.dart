import 'package:flutter/material.dart';
import 'package:line_chart/home_page.dart';
import 'package:line_chart/views/first_line_chart.dart';
import 'package:line_chart/views/second_line_chart.dart';
import 'package:line_chart/views/third_line_chart.dart';

class Routes {

  Routes._();

  static const String home = '/home';
  static const String fistLineChart = '/firstLineChart';
  static const String secondLineChart = '/secondLineChart';
  static const String thirdLineChart = '/thirdLineChart';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomePage(),
    fistLineChart: (BuildContext context) => const FirstLineChartPage(),
    secondLineChart: (BuildContext context) => const SecondLineChartPage(),
    thirdLineChart: (BuildContext context) => const ThirdLineChartPage(),
  };
}



