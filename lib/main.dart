import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/Routing/Routing.dart';
import 'core/styles/theme_style.dart';
import 'features/navigation_screen/logic/home_screen_cubit.dart';
import 'features/notification/domain/notifications_cubit.dart';
import 'features/settings/data/models/settings_model.dart';
import 'features/settings/domain/cubits/settings_cubit.dart';
import 'features/statistics/domain/cubits/statistics_cubit/statistics_cubit.dart';
import 'features/wifi_screen/Logic/conection_cubit.dart';
import 'features/wifi_screen/Logic/conection_state.dart';
import 'features/wifi_screen/ui/no_connection_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(SettingsModelAdapter());
  await Hive.openBox<SettingsModel>('settings');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotificationsCubit()),
        BlocProvider(create: (context) => HomeScreenCubit()),
        BlocProvider(create: (context) => ConnectionScreenCubit()),
        BlocProvider(
          create: (context) => StatisticsCubit()..initialize(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit()..getSettingsModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionScreenCubit, WifiState>(
      builder: (context, state) {
        if (state is Disconnected) {
          return const NoConnectionScreen(); // Display no connection screen
        } else {
          return MaterialApp.router(
            theme: ThemeStyle.lightThemeData,
            debugShowCheckedModeBanner: false,
            routerConfig: Routing.router,
          );
        }
      },
    );
  }
}
