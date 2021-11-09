import 'package:flutter/material.dart';
import 'package:flutter_covid_app/screens/onboarding/onboard.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      theme: ThemeData(
        splashColor: const Color(0xffDBD56E),
        cardColor: const Color(0xffF2EFEA),
        shadowColor: const Color(0xff66D7D1),
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
