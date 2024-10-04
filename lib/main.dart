import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/Routing/Routing.dart';
import 'core/helpers/functions.dart';
import 'core/local/local_settings.dart';
import 'core/styles/theme_style.dart';
import 'features/navigation_screen/logic/home_screen_cubit.dart';
import 'features/notification/domain/notifications_cubit.dart';
import 'features/settings/data/models/settings_model.dart';
import 'features/settings/domain/cubits/settings_cubit.dart';
import 'features/statistics/domain/cubits/statistics_cubit/statistics_cubit.dart';
import 'features/theme/domain/cubits/theme_cubit/theme_cubit.dart';
import 'features/wifi_screen/Logic/conection_cubit.dart';
import 'features/wifi_screen/Logic/conection_state.dart';
import 'features/wifi_screen/ui/no_connection_screen.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(SettingsModelAdapter());
  await Hive.openBox<SettingsModel>('settings');
  await LocalSettings.initializeSettings();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotificationsCubit()),
        BlocProvider(create: (context) => HomeScreenCubit()),
        BlocProvider(create: (context) => ConnectionScreenCubit()),
        BlocProvider(create: (context) => StatisticsCubit()),
        BlocProvider(create: (context) => SettingsCubit()..getSettingsModel()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<ConnectionScreenCubit, WifiState>(
          builder: (context, state) {
            if (state is Disconnected) {
              return const NoConnectionScreen();
            } else {
              return MaterialApp.router(
                builder: InAppNotifications.init(),
                locale: Locale(
                  Functions.getLanguageCode(
                    LocalSettings.getSettings().language,
                  ),
                ),
                localizationsDelegates: localizationsDelegates(),
                supportedLocales: S.delegate.supportedLocales,
                theme: (LocalSettings.getSettings().themeMode == "Light" ||
                        LocalSettings.getSettings().themeMode == "فاتح")
                    ? ThemeStyle.lightThemeData
                    : ThemeStyle.darkThemeData,
                debugShowCheckedModeBanner: false,
                routerConfig: Routing.router,
              );
            }
          },
        );
      },
    );
  }

  List<LocalizationsDelegate<dynamic>> localizationsDelegates() {
    return const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }
}
