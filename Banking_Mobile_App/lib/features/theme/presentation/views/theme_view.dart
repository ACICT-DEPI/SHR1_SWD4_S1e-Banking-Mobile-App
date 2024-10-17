import 'package:flutter/material.dart';

import 'widgets/theme_view_body.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ThemeViewBody(),
      ),
    );
  }
}
