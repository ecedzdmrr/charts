import 'package:flutter/material.dart';
import 'package:pie_chart/home_page.dart';
import 'package:pie_chart/views/first_pie_chart.dart';
import 'package:pie_chart/views/second_pie_chart.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String firstPieChart = '/firstPieChart';
  static const String secondPieChart = '/secondPieChart';
  static const String nehirDeneme = '/nehirDeneme';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomePage(),
    firstPieChart: (BuildContext context) => const FirstPieChartPage(),
    secondPieChart: (BuildContext context) => const SecondPieChartPage(),
  };
}
