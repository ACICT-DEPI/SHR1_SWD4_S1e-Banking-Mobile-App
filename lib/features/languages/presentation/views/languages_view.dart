import 'package:flutter/material.dart';

import 'widgets/languages_view_body.dart';

class LanguagesView extends StatelessWidget {
  const LanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LanguagesViewBody(),
      ),
    );
  }
}
