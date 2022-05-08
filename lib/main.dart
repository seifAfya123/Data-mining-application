import 'package:dm_project/screens/home_screen.dart';
import 'package:dm_project/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data mining project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
        OnBoardingScreen.routeName: (BuildContext context) =>
            const OnBoardingScreen(),
      },
      initialRoute: OnBoardingScreen.routeName,
    );
  }
}
