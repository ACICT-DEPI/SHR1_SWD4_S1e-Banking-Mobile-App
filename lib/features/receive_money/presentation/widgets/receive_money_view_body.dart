import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/firebase_authentication.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../navigation_screen/logic/home_screen_cubit.dart';
import 'id_qr_code.dart';
import 'receive_id_text_field.dart';

class ReceiveMoneyViewBody extends StatelessWidget {
  const ReceiveMoneyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final String userId = FirebaseAuthentication.getUserId();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomAppBar(
            appBarTitle: S.of(context).ReceiveMoney,
            leftIcon: Icons.arrow_back_ios_new_outlined,
            onPressedLeft: () {
              GoRouter.of(context).pop();
              BlocProvider.of<HomeScreenCubit>(context).initialize();
            },
          ),
          const SizedBox(height: 40),
          IdQrCode(
            id: userId,
          ),
          const SizedBox(height: 25.0),
          ReceiveIdTextField(
            id: userId,
          ),
        ],
      ),
    );
  }
}
