import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/screens/full_screen_hero.dart';


class SymptomsImages extends StatelessWidget {
  SymptomsImages({Key? key}) : super(key: key);

  List covidImages = [
    'assets/sick1.png',
    'assets/sick2.png',
    'assets/sick3.png',
    'assets/sick4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          shrinkWrap: true,
          children: List.generate(
            covidImages.length,
                (index) => InkWell(
              child: Image.asset(
                '${covidImages[index]}',
                fit: BoxFit.cover,
                height: 300.0,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FullScreenHero(
                      imageUrl: '${covidImages[index]}',
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}