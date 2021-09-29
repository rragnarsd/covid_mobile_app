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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child:
      GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        shrinkWrap: true,
        children: List.generate(
          covidImages.length,
              (index) => InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.blue)
              ),
              child: Image.asset(
                '${covidImages[index]}',
                fit: BoxFit.cover,
                height: 300.0,
              ),
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
    );
  }
}