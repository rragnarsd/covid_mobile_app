import 'package:flutter/material.dart';
import 'package:flutter_covid_app/screens/home_page.dart';
import 'package:flutter_covid_app/screens/onboarding/onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
  /*    darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,*/
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xffFC7753), primary: Color(0xffFC7753), ),
      ),
      home: const OnBoardingScreen()
    );
  }
}

