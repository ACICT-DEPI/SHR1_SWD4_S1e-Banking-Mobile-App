import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubits/get_cards_cubit/get_cards_cubit.dart';
import '../domain/cubits/send_money_cubit/send_money_cubit.dart';
import 'widgets/send_money_screen_body.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SendMoneyCubit(),
        ),
        BlocProvider(
          create: (context) => GetCardsCubit()..getAllCards(),
        )
      ],
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SendMoneyScreenBody(),
        ),
      ),
    );
  }
}
