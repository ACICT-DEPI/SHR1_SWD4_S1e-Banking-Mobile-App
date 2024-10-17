import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/local/local_settings.dart';
import '../../../core/styles/texts_style.dart';
import '../../../core/styles/theme_style.dart';
import '../../../core/widgets/custom_app_button.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: (LocalSettings.getSettings().themeMode == "Light" ||
              LocalSettings.getSettings().themeMode == "فاتح")
          ? ThemeStyle.lightThemeData
          : ThemeStyle.darkThemeData,
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
                  (LocalSettings.getSettings().language == "English")
                      ? "No Internet Connection"
                      : "لا يوجد اتصال بالإنترنت",
                  textAlign: TextAlign.center,
                  style: TextsStyle.textStyleSemiBold26,
                ),
              ),
              const SizedBox(height: 40),
              CustomAppButton(
                title: (LocalSettings.getSettings().language == "English")
                    ? "Open WiFi Settings"
                    : "فتح إعدادات WiFi",
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
      const AndroidIntent intent = AndroidIntent(
        action: 'android.settings.WIFI_SETTINGS',
      );
      await intent.launch();
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      const url = 'App-Prefs:root=WIFI';
      if (await canLaunchUrl(Uri(path: url))) {
        await launchUrl(Uri(path: url));
      } else {
        throw (LocalSettings.getSettings().language == "English")
            ? "Could not open WiFi settings"
            : "تعذر فتح إعدادات WiFi";
      }
    }
  }
}
