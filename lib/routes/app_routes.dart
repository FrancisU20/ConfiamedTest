import 'package:flutter/material.dart';
import 'package:confiamedtest/screens/citas/cita_screen.dart';
import 'package:confiamedtest/screens/citas/cita_home_screen.dart';
import 'package:confiamedtest/screens/citas/cita_list_screen.dart';

class Routes {
  static const String citaHome = '/citas-home';
  static const String citaList = '/citas-list';
  static const String citaScreen = '/cita-det';

  static Map<String, WidgetBuilder> get routes {
    return {
      citaHome: (context) => const CitaHomeScreen(),
      citaList: (context) => const CitaListScreen(),
      citaScreen: (context) => const CitaScreen(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case citaHome:
        return MaterialPageRoute(builder: (_) => const CitaHomeScreen());
      case citaList:
        return MaterialPageRoute(builder: (_) => const CitaListScreen());
      case citaScreen:
        return MaterialPageRoute(builder: (_) => const CitaScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
