import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../core/styles/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
          width: 50,
          height:50,
          child: Lottie.asset("assets/images/indicator.json")),
    );
  }
}
