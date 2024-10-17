import 'package:flutter/material.dart';

import 'widgets/contact_us_view_body.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ContactUsViewBody(),
      ),
    );
  }
}
