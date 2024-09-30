import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_app/core/Routing/Routing.dart';
import 'package:bank_app/features/service/presentation/widgets/service_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors.dart';
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
        shadowColor: AppColors.greyA7,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.lightGrey, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2.0,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              service.icon,
              size: 40.0,
              color: Colors.blue, // Customize icon color
            ),
            SizedBox(height: 10),
            Container(
              width: 100,
              child: AutoSizeText(
                service.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
