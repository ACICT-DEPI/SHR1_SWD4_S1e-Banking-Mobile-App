import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/local/local_settings.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/texts_style.dart';
import '../../../../../../../generated/l10n.dart';

class BuildActionsRow extends StatefulWidget {
  final Function onPressedSent;
  final Function onPressedReceive;
  final Function onPressedTopUp;

  const BuildActionsRow({
    super.key,
    required this.onPressedSent,
    required this.onPressedReceive,
    required this.onPressedTopUp,
  });

  @override
  State<BuildActionsRow> createState() => _BuildActionsRowState();
}

class _BuildActionsRowState extends State<BuildActionsRow> {
  Widget _buildActionButton(IconData icon, String label, Function onPressed) {
    final double widthFactor = MediaQuery.of(context).size.width / 411;
    return SizedBox(
      width: 60 * widthFactor,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor:
                (LocalSettings.getSettings().themeMode == "Light" ||
                        LocalSettings.getSettings().themeMode == "فاتح")
                    ? AppColors.greyF4
                    : AppColors.dark,
            // Background color for both CircleAvatar and IconButton
            child: IconButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.transparent,
                ),
              ),
              icon: Icon(
                icon,
                size: 30,
                color: (LocalSettings.getSettings().themeMode == "Light" ||
                        LocalSettings.getSettings().themeMode == "فاتح")
                    ? AppColors.dark
                    : AppColors.white,
              ),
              onPressed: () => onPressed(),
            ),
          ),
          Container(
            width: 60 * widthFactor,
            alignment: Alignment.center,
            child: AutoSizeText(
              maxLines: 1,
              label,
              style: TextsStyle.textStyleRegular12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(
          Icons.arrow_upward,
          S.of(context).Send,
          widget.onPressedSent,
        ),
        _buildActionButton(
          Icons.arrow_downward,
          S.of(context).Receive,
          widget.onPressedReceive,
        ),
        _buildActionButton(
          Icons.payment_rounded,
          S.of(context).Services,
          widget.onPressedTopUp,
        ),
      ],
    );
  }
}
