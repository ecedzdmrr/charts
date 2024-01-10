import 'package:bar_chart/utils/colors.dart';
import 'package:bar_chart/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                Navigator.of(context).pushNamed(Routes.fistBarChart);
              },
              child: const Text(
                'First Chart',
                style: TextStyle(
                  color: AppColors.utOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Gap(25),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.secondBarChart);
              },
              child: const Text(
                'Second Chart',
                style: TextStyle(
                  color: AppColors.utOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Gap(25),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.thirdBarChart);
              },
              child: const Text(
                'Third Chart',
                style: TextStyle(
                  color: AppColors.utOrange,
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
