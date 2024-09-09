import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/styles/texts_style.dart';



class Buildactionsrow extends StatefulWidget {
  final Function onPressedSent;
  final Function onPressedReceive;
  final Function onPressedLoan;
  final Function onPressedTopup;

  const Buildactionsrow({
    super.key,
    required this.onPressedSent,
    required this.onPressedReceive,
    required this.onPressedLoan,
    required this.onPressedTopup,
  });

  @override
  State<Buildactionsrow> createState() => _BuildactionsrowState();
}

class _BuildactionsrowState extends State<Buildactionsrow> {
  Widget _buildActionButton(IconData icon, String label, Function onPressed) {
    return Container(
      width: 60,
      height: 120,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.greyF4,
            child: IconButton(
              icon: Icon(icon, color: Colors.black, size: 30),
              onPressed: () => onPressed(),
            ),
          ),
          Text(label, style: TextsStyle.textStyleRegular12),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(Icons.arrow_upward, "Sent", widget.onPressedSent),
        _buildActionButton(Icons.arrow_downward, "Receive", widget.onPressedReceive),
        _buildActionButton(Icons.monetization_on_outlined, "Loan", widget.onPressedLoan),
        _buildActionButton(Icons.cloud_upload_outlined, "Topup", widget.onPressedTopup),
      ],
    );
  }
}
