import 'package:flutter/material.dart';
import 'package:flutter_covid_app/screens/onboarding/onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Theme.of(context).backgroundColor,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Color(0xffDBD56E),
        cardColor: const Color(0xffF2EFEA),
        shadowColor: Color(0xff66D7D1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xffFC7753),
          primary: const Color(0xffFC7753),
          background: const Color(0xffF2EFEA),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff403D58),
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xff66D7D1),
        ),
      ),
      home: const OnBoardingScreen(),
    );
  }
}
