import 'package:flutter/material.dart';
import 'package:testovoe/navigation/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = _App();
  runApp(app);
}

class _App extends StatelessWidget {
  final mainNavigation = MainNavigation();

  _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.firstPage,
      routes: MainNavigation.routes,
    );
  }
}