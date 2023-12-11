import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_chart/utils/routes.dart';

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
                Navigator.of(context).pushReplacementNamed(Routes.fistChart);
              },
              child: const Text(
                'First Chart',
                style: TextStyle(
                  color: Color(0xFF5F6F52),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Gap(25),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.fistChart);
              },
              child: const Text(
                'Second Chart',
                style: TextStyle(
                  color: Color(0xFF5F6F52),
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
