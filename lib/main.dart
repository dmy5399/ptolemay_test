import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_test/core/util/config.dart';
import 'package:ptolemay_test/core/constants/routes.dart';
import 'package:ptolemay_test/presentation/bloc/counter/counter_bloc.dart';
import 'package:ptolemay_test/presentation/bloc/theme/theme_bloc.dart';
import 'package:ptolemay_test/presentation/bloc/weather/weather_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Config.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          late ThemeData theme;

          if(state is ThemeDark) {
            theme = ThemeData.dark();
          } else {
            theme = ThemeData.light();
          }

          return MaterialApp(
            title: 'Ptolemay test',
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: Routes.homeScreen,
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}