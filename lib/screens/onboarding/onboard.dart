import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_covid_app/screens/home_page.dart';
import 'package:flutter_covid_app/utils/onboard_list.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void nextPage() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const SizedBox(
          height: 60.0,
        ),
        Expanded(
          child: PageView.builder(
              controller: _controller,
              itemCount: items.length,
              onPageChanged: onChanged,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Lottie.network(items[index].url,
                        width: MediaQuery.of(context).size.width / 1.5),
                    Text(
                      items[index].title,
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      items[index].content,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              items.length,
              (index) => Container(
                    height: 10.0,
                    width: currentIndex == index ? 25 : 10,
                    margin: const EdgeInsets.only(right: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xffFC7753),
                    ),
                  )),
        ),
        Container(
          height: 50.0,
          width: double.infinity,
          margin: const EdgeInsets.all(40.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffFC7753),
              ),
              child: Text(
                currentIndex == items.length - 1 ? 'Continue' : 'Next',
                style: const TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                if (currentIndex == items.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
                nextPage();
              }),
        )
      ]),
    );
  }
}
