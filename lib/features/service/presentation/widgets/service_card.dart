import 'package:bank_app/core/Routing/Routing.dart';
import 'package:bank_app/features/service/presentation/widgets/service_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       context.push(Routing.serviceView, extra: service);
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              service.icon,
              size: 40.0,
              color: Colors.blue, // Customize icon color
            ),
            SizedBox(height: 10),
            Text(
              service.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
