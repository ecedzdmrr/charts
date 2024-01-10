import 'package:bar_chart/home_page.dart';
import 'package:bar_chart/views/first_bar_chart.dart';
import 'package:bar_chart/views/second_bar_chart.dart';
import 'package:bar_chart/views/third_bar_chart.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String fistBarChart = '/firstBarChart';
  static const String secondBarChart = '/secondBarChart';
  static const String thirdBarChart = '/thirdBarChart';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomePage(),
    fistBarChart: (BuildContext context) => const FirsBarChartPage(),
    secondBarChart: (BuildContext context) => const SecondBarChartPage(),
    thirdBarChart: (BuildContext context) => const ThirdBarChartPage(),
  };
}
