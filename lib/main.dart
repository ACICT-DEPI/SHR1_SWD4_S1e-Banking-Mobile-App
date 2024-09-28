import 'package:bank_app/features/notification/domain/notifications_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/Routing/Routing.dart';
import 'core/styles/theme_style.dart';

import 'features/local_auth/ui/local_auth.dart';
import 'features/navigation_screen/logic/home_screen_cubit.dart';
import 'features/statistics/domain/cubits/statistics_cubit/statistics_cubit.dart';
import 'features/wifi_screen/Logic/conection_cubit.dart';
import 'features/wifi_screen/Logic/conection_state.dart';
import 'features/wifi_screen/ui/no_connection_screen.dart'; // No Connection UI
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotificationsCubit()),

        BlocProvider(create: (context) => HomeScreenCubit()),
        BlocProvider(create: (context) => ConnectionScreenCubit()),
        BlocProvider(
          create: (context) => StatisticsCubit()..initialize(),
        )
      ],
      child:  const MyApp(),
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
