import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/styles/texts_style.dart';

class BuildActionsRow extends StatefulWidget {
  final Function onPressedSent;
  final Function onPressedReceive;
  final Function onPressedLoan;
  final Function onPressedTopUp;

  const BuildActionsRow({
    super.key,
    required this.onPressedSent,
    required this.onPressedReceive,
    required this.onPressedLoan,
    required this.onPressedTopUp,
  });

  @override
  State<BuildActionsRow> createState() => _BuildActionsRowState();
}

class _BuildActionsRowState extends State<BuildActionsRow> {
  Widget _buildActionButton(IconData icon, String label, Function onPressed) {
    return SizedBox(
      width: 60,
      height: 120,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.greyF4,
            // Background color for both CircleAvatar and IconButton
            child: IconButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.transparent,
                ),
              ),
              icon: Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () => onPressed(),
            ),
          ),
          Text(
            label,
            style: TextsStyle.textStyleRegular12,
          ),
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
        _buildActionButton(
            Icons.arrow_downward, "Receive", widget.onPressedReceive),
        _buildActionButton(
            Icons.monetization_on_outlined, "Loan", widget.onPressedLoan),
        _buildActionButton(
            Icons.cloud_upload_outlined, "Topup", widget.onPressedTopUp),
      ],
    );
  }
}
