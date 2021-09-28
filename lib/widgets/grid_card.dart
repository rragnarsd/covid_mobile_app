import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final Color color;
  final String hedText;
  final String subHed;
  final IconData icon;

  const GridCard({
    Key? key, required this.color, required this.hedText, required this.subHed, required this.icon
  }) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          color: color,
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 4.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 40.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  hedText,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  subHed,
                  style: const TextStyle(fontSize: 16.0),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
