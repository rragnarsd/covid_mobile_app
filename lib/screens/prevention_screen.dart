import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/widgets/expension_list_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prevention',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 20.0,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/vector/vaccine.png',
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Stay safe by taking simple precautions, such as physical distancing, wearing a mask, keeping rooms well ventilated, avoiding crowds, cleaning your hands more often, and coughing into a bent elbow or tissue. Check local advice where you live and work.',
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.2,
                      color: Colors.black, letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
