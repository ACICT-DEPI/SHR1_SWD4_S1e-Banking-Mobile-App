import 'package:bank_app/core/styles/texts_style.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  const ChartItem({
    super.key,
    required this.text,
    required this.firstColor,
    required this.secondColor,
  });

  final Color firstColor;
  final Color secondColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [secondColor, firstColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: firstColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextsStyle.textStyleRegular13,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
