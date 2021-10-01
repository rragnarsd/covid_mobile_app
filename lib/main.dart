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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Color(0xffFC7753),
            primary: Color(0xffFC7753),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff403D58),
          ),
         dividerTheme: DividerThemeData(color: Color(0xff66D7D1),),
        ),
        home: const OnBoardingScreen(),
    );
  }
}
