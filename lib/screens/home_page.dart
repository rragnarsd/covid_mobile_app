import 'package:flutter/material.dart';
import 'package:flutter_covid_app/screens/prevention_screen.dart';
import 'package:flutter_covid_app/screens/symptoms_screen.dart';
import 'package:flutter_covid_app/widgets/grid_card.dart';
import 'package:flutter_covid_app/widgets/requirement_circles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List colors = [Colors.teal, Colors.yellow, Colors.blue, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100.0,
            ),
            const Text(
              'Prevent COVID-19',
              style: TextStyle(fontSize: 25.0),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridCard(
                  icon: Icons.sick,
                  color: colors[0],
                  hedText: 'Symptoms',
                  subHed: 'Identify the risk of infection',
                  function: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SymptomsScreen(),
                      ),
                    )
                  },
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GridCard(
                  icon: Icons.coronavirus,
                  color: colors[1],
                  hedText: 'Prevention',
                  subHed: 'Avoid the risk of infection',
                  function: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PreventionScreen(),
                      ),
                    )
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridCard(
                  icon: Icons.report,
                  color: colors[2],
                  hedText: 'Statistics',
                  subHed: 'Data related to the disease',
                  function: () => {},
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GridCard(
                  icon: Icons.language,
                  color: colors[3],
                  hedText: 'Countries',
                  subHed: 'Infected countries by COVID-19',
                  function: () => {},
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Divider(
              color: Colors.teal,
            ),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Requirements',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Help you prevent viruses better',
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RequirementCircles(
                      icon: FontAwesomeIcons.mask,
                      color: colors[3],
                      text: 'Mask',
                    ),
                    RequirementCircles(
                      icon: FontAwesomeIcons.bandAid,
                      color: colors[2],
                      text: 'Gloves',
                    ),
                    RequirementCircles(
                      icon: FontAwesomeIcons.soap,
                      color: colors[1],
                      text: 'Soap',
                    ),
                    RequirementCircles(
                      icon: FontAwesomeIcons.hospital,
                      color: colors[0],
                      text: 'Sanitizers',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
