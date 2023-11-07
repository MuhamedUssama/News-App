import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/Home/home.dart';
import 'package:news_app/ui/screens/splash/splach_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeDesign.routeName: (_) => const HomeDesign(),
        SplashScreen.routeName: (_) => const SplashScreen(),
      },
      initialRoute: HomeDesign.routeName,
    );
  }
}
