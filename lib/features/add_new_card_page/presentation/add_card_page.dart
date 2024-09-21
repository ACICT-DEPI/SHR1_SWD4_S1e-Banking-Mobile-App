import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubits/add_card_cubit.dart';
import 'widgets/add_card_screen_body.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCardCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: AddCardScreenBody(),
        ),
      ),
    );
  }
}
