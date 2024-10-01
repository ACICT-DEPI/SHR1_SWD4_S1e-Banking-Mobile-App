import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/Routing/Routing.dart';

import '../../../../core/widgets/Loading_screen.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../../core/widgets/error_screen.dart';
import '../../../navigation_screen/data/models/card_model.dart';
import '../../../navigation_screen/logic/home_screen_cubit.dart';
import '../../../navigation_screen/presentation/home/presentation/views/widgets/bank_card_design.dart';
import '../../../statistics/domain/cubits/statistics_cubit/statistics_cubit.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';
import '../../domain/cubits/get_cards_cubit/get_cards_cubit.dart';
import '../../domain/cubits/get_cards_cubit/get_cards_state.dart';
import '../../domain/cubits/service_cubit/service_cubit.dart';
import '../../domain/cubits/service_cubit/service_state.dart';
import 'amount_text_field.dart';
import 'payment_id_text_field.dart';
import 'service_container.dart';

class ServiceViewBody extends StatefulWidget {
  final TransactionType service;

  const ServiceViewBody({super.key, required this.service});

  @override
  State<ServiceViewBody> createState() => _ServiceViewBodyState();
}

class _ServiceViewBodyState extends State<ServiceViewBody> {
  int selectedCardIndex = 0;
  TextEditingController idController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ServiceCubit()),
          BlocProvider(create: (context) => GetCardsCubit()..getAllCards()),
        ],
        child: BlocConsumer<ServiceCubit, ServiceState>(
          listener: (context, sendMoneyState) {
            if (sendMoneyState is ServiceSuccessState) {
              BlocProvider.of<HomeScreenCubit>(context).initialize();
              BlocProvider.of<StatisticsCubit>(context).initialize();
              GoRouter.of(context)
                  .pushReplacement(Routing.transactionHistoryView);
            }
          },
          builder: (context, sendMoneyState) {
            return BlocBuilder<GetCardsCubit, GetCardsState>(
              builder: (context, getAllCardsState) {
                if (sendMoneyState is ServiceLoadingState ||
                    getAllCardsState is GetCardsLoadingState) {
                  return const LoadingScreen();
                } else if (getAllCardsState is GetCardsFailedState) {
                  return ErrorScreen(
                    message: getAllCardsState.errMessage,
                    onPressed: () => GoRouter.of(context).pop(),
                  );
                } else if (sendMoneyState is ServiceFailedState) {
                  return ErrorScreen(
                    message: sendMoneyState.message,
                    onPressed: () => GoRouter.of(context).pop(),
                  );
                } else if (getAllCardsState is GetCardsSuccessState) {
                  return _buildServiceForm(context, getAllCardsState);
                } else {
                  return const LoadingScreen();
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildServiceForm(
    BuildContext context,
    GetCardsSuccessState getAllCardsState,
  ) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView(
          children: [
            CustomAppBar(
              appBarTitle: "Service",
              leftIcon: Icons.arrow_back_ios_new_outlined,
              onPressedLeft: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 35),
            _buildCardSlider(getAllCardsState.cards),
            const SizedBox(height: 30),
            PaymentIdTextField(textController: idController),
            const SizedBox(height: 16),
            AmountTextField(textController: amountController),
            const SizedBox(height: 16),
            ServiceContainer(service: widget.service),
            // _buildServiceInfoCard(),
            const SizedBox(height: 30),
            _buildSubmitButton(context, getAllCardsState),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSlider(List<CardModel> cards) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: PageView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: BankCardDesign(card: card),
          );
        },
        onPageChanged: (index) {
          setState(() {
            selectedCardIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildSubmitButton(
      BuildContext context, GetCardsSuccessState getAllCardsState) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomAppButton(
        title: 'Continue',
        onPressed: () {
          setState(() {
            autoValidateMode = AutovalidateMode.always;
          });
          if (formKey.currentState!.validate()) {
            BlocProvider.of<ServiceCubit>(context).sendMoney(
              id: idController.text,
              transactionItem: _buildTransactionItemModel(),
              card: getAllCardsState.cards[selectedCardIndex],
            );
          }
        },
      ),
    );
  }

  TransactionItemModel _buildTransactionItemModel() {
    return TransactionItemModel(
      type: widget.service,
      amount: -double.parse(amountController.text),
    );
  }
}
