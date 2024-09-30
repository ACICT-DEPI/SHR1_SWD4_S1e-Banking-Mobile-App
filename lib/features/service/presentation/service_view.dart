// lib/features/service/presentation/service_view.dart
import 'package:bank_app/features/service/presentation/widgets/all_services.dart';
import 'package:bank_app/features/service/presentation/widgets/service_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubits/get_cards_cubit/get_cards_cubit.dart';
import '../domain/cubits/service_cubit/service_cubit.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PaymentServicesScreen(),
      ),
    );
  }
}
