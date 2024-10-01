import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/error_screen.dart';
import '../../../../../generated/l10n.dart';
import '../../../../transaction_history/data/models/transaction_item_model.dart';
import '../../../domain/cubits/search_cubit.dart';
import 'search_text_field.dart';
import 'search_transaction_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
          child: Column(
            children: [
              CustomAppBar(
                appBarTitle: S.of(context).Search,
                leftIcon: Icons.arrow_back_ios_new_outlined,
                onPressedLeft: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 32),
              SearchTextField(
                searchController: searchController,
                onChanged: (p0) {
                  BlocProvider.of<SearchCubit>(context).getTransactions(
                    searchController.text,context
                  );
                },
              ),
              const SizedBox(height: 30),
              if (state is SearchSuccess) ...{
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.transactions.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 22,
                    ),
                    itemBuilder: (context, index) {
                      return SearchTransactionItem(
                        transactionItemModel: TransactionItemModel(
                            type: state.transactions[index].type,
                            amount: state.transactions[index].amount,
                            createdAt: state.transactions[index].createdAt),
                      );
                    },
                  ),
                ),
              } else if (state is SearchFailed) ...{
                ErrorScreen(message: state.errMessage),
              } else if (state is SearchInitial) ...{
                Center(
                  child: Text(S.of(context).StartSearching),
                )
              } else ...{
                const LoadingScreen()
              }
            ],
          ),
        );
      },
    );
  }
}
