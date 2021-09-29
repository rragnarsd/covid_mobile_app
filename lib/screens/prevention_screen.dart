import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/widgets/expension_list_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 300.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.blueAccent],
                ),
                image: DecorationImage(
                  image: AssetImage('assets/vector/virus-test.png'),
                ),
              ),
            ),
          ),
          Column(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    ExpansionTileList(
                      hedText: 'Avoid contact with sick people',
                      subText:
                          'Maintain at least a 1-metre distance between other people. Maintain an even greater distance between yourself and others when indoors. The further away, the better.',
                      icon: Icons.sick,
                    ),
                    ExpansionTileList(
                      hedText: 'Wash your hands with soap',
                      subText:
                          'Regulary and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. This elimnates germs including viruses that may be on your hands.',
                      icon: FontAwesomeIcons.soap,
                    ),
                    ExpansionTileList(
                      hedText: 'Use medical face mask',
                      subText:
                          'Clean your hands before you put your mask on, as well as before and after you take it off, and after you touch it at any time.',
                      icon: FontAwesomeIcons.mask,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
