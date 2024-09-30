import 'package:bank_app/features/service/presentation/widgets/service_card.dart';
import 'package:flutter/material.dart';

import '../../data/model/service_model.dart';


class PaymentServicesScreen extends StatelessWidget {
  final List<ServiceModel> services = [
    ServiceModel('Home Internet', Icons.router),
    ServiceModel('Mobile Bill', Icons.phone_android),
    ServiceModel('Mobile Recharge', Icons.mobile_friendly),
    ServiceModel('Social Insurance', Icons.family_restroom),
    ServiceModel('Fawry Pay', Icons.payment),
    ServiceModel('Landline', Icons.call),
    ServiceModel('Electricity', Icons.electric_bolt),
    ServiceModel('Finance and Banks', Icons.account_balance),
    ServiceModel('Donations', Icons.volunteer_activism),
    ServiceModel('Games', Icons.gamepad),
    ServiceModel('Gas', Icons.local_fire_department),
    ServiceModel('Tickets', Icons.confirmation_num),
    ServiceModel('Microfinance', Icons.attach_money),
    ServiceModel('Education', Icons.school),
    ServiceModel('Save Gaza', Icons.flag),
    ServiceModel('Daily Waste', Icons.delete),
    ServiceModel('Payments', Icons.money),
    ServiceModel('Unions', Icons.badge),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8, // Adjust for icon-label ratio
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return ServiceCard(service: services[index]);
          },
        ),
      ),
    );
  }
}



