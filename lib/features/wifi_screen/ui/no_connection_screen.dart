import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/styles/texts_style.dart';
import '../../../core/styles/theme_style.dart';
import '../../../core/widgets/custom_app_button.dart';

class NoConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeStyle.lightThemeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/internet.json'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "No Internet Connection",
                  textAlign: TextAlign.center,
                  style: TextsStyle.textStyleSemiBold26,
                ),
              ),
              const SizedBox(height: 40),
              CustomAppButton(
                title: "Open WiFi Settings",
                onPressed: () {
                  _openWiFiSettings(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openWiFiSettings(BuildContext context) async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      final AndroidIntent intent = AndroidIntent(
        action: 'android.settings.WIFI_SETTINGS',
      );
      await intent.launch();
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      const url = 'App-Prefs:root=WIFI';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not open WiFi settings';
      }
    }
  }
}
