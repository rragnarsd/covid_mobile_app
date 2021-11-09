import 'package:flutter/material.dart';
import 'package:flutter_covid_app/screens/screens.dart';
import 'package:flutter_covid_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppHeader(image: 'assets/vector/vaccine.png'),
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
                  color: Theme.of(context).colorScheme.secondary,
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
                  color: Theme.of(context).shadowColor,
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
                  color: Theme.of(context).cardColor,
                  hedText: 'Statistics',
                  subHed: 'Data related to the disease',
                  function: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const StatisticScreen(),
                      ),
                    )
                  },
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GridCard(
                  icon: Icons.language,
                  color: Theme.of(context).splashColor,
                  hedText: 'Countries',
                  subHed: 'Infected countries by COVID-19',
                  function: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CountriesScreen(),
                      ),
                    )
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Divider(
                  color: Theme.of(context).dividerTheme.color, thickness: 1.0,
              ),
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
                      color: Theme.of(context).splashColor,
                      text: 'Mask',
                      function: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MaskScreen(),
                          ),
                        );
                      },
                    ),
                    RequirementCircles(
                      icon: FontAwesomeIcons.soap,
                      color: Theme.of(context).shadowColor,
                      text: 'Soap',
                      function: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SoapScreen(),
                          ),
                        );
                      },
                    ),
                    RequirementCircles(
                      icon: FontAwesomeIcons.hospital,
                      color: Theme.of(context).colorScheme.secondary,
                      text: 'Sanitizers',
                      function: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SanitizerScreen(),
                          ),
                        );
                      },
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
