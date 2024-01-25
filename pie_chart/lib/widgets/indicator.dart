import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.textColor,
    this.size = 16,
  });

  final Color color;
  final String text;
  final bool isSquare;
  final Color? textColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            // ?
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const Gap(5),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
