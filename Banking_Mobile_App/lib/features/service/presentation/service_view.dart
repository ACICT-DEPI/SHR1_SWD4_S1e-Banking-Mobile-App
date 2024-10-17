import 'package:flutter/material.dart';

import 'widgets/all_services.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PaymentServicesScreen(),
      ),
    );
  }
}
