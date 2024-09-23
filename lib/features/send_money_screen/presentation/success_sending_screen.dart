import 'package:flutter/material.dart';

import '../data/models/success_model.dart';
import 'widgets/success_sending_screen_body.dart';

class SuccessSendingScreen extends StatelessWidget {
  final SuccessModel successModel;

  const SuccessSendingScreen({super.key, required this.successModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SuccessSendingScreenBody(successModel: successModel),
      ),
    );
  }
}
