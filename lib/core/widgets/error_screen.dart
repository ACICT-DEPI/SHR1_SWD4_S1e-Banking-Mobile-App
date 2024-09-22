import 'package:bank_app/features/send_money_screen/presentation/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../styles/colors.dart';
import '../styles/texts_style.dart';
import 'custom_app_button.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [

          Lottie.asset('assets/images/Animation - 1727028943609.json'),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message,style: TextsStyle.textStyleSemiBold24.copyWith(color: AppColors.dark),),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomAppButton(title: "Try Again", onPressed: (){

            }),
          ),


        ],),
      ),
    );

  }
}
