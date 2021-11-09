import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/screens/screens.dart';
import 'package:flutter_covid_app/utils/constants.dart';

class SymptomsImages extends StatefulWidget {
  const SymptomsImages({Key? key}) : super(key: key);

  @override
  State<SymptomsImages> createState() => _SymptomsImagesState();
}

class _SymptomsImagesState extends State<SymptomsImages> {
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
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        shrinkWrap: true,
        children: List.generate(
          covidImages.length,
          (index) => InkWell(
            child: Container(
              decoration: kBoxDecorationShadow.copyWith(
                  border: Border.all(width: 0.5, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(3, 0),
                    ),
                  ]),
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
