import 'package:flutter/material.dart';
import 'package:ptolemay_test/presentation/screens/home/home_screen.dart';

class Routes {
  static const String homeScreen = '/home';

  static final Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => const HomeScreen(),
  };

}
