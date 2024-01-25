import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pie_chart/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.firstPieChart);
              },
              child: const Text(
                'First Chart',
                style: TextStyle(
                  color: Color(0xFF61A3BA),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Gap(25),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.secondPieChart);
              },
              child: const Text(
                'Second Chart',
                style: TextStyle(
                  color: Color(0xFF61A3BA),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
