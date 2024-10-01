import 'package:bank_app/core/helpers/functions.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../search/presentation/views/widgets/search_text_field.dart';
import '../../../transaction_history/data/models/transaction_item_model.dart';
import 'service_card.dart';

class PaymentServicesScreen extends StatefulWidget {
  const PaymentServicesScreen({super.key});

  @override
  State<PaymentServicesScreen> createState() => _PaymentServicesScreenState();
}

class _PaymentServicesScreenState extends State<PaymentServicesScreen> {
  TextEditingController searchController = TextEditingController();

  final List<TransactionType> services = Constants.services;

  List<TransactionType> getFilteredServices(String query) {
    List<TransactionType> filteredServices = [];

    if (query.isEmpty) {
      return services;
    } else {
      for (var service in services) {
        String serviceName = Functions.getTransactionTitle(service);
        if (serviceName.toLowerCase().contains(query.toLowerCase())) {
          filteredServices.add(service);
        }
      }
      return filteredServices;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Column(
          children: [
            CustomAppBar(
              appBarTitle: "Services",
              leftIcon: Icons.arrow_back_ios_new_outlined,
              onPressedLeft: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SearchTextField(
              onChanged: (value) {
                setState(() {
                  searchController.text = value;
                });
              },
              searchController: searchController,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.8, // Adjust for icon-label ratio
                ),
                itemCount: getFilteredServices(searchController.text).length,
                itemBuilder: (context, index) {
                  return ServiceCard(
                    service: getFilteredServices(searchController.text)[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
