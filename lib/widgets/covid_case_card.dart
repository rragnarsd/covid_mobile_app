import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/utils/constants.dart';

class CovidCaseCard extends StatefulWidget {
  final String text;
  final String numbers;

  const CovidCaseCard({Key? key, required this.text, required this.numbers})
      : super(key: key);

  @override
  State<CovidCaseCard> createState() => _CovidCaseCardState();
}

class _CovidCaseCardState extends State<CovidCaseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      child: Container(decoration: kBoxDecorationShadow,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            color: Colors.white70,
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.coronavirus, color: Color(0xffFC7753) ,),
                  const SizedBox(height: 10.0,),
                  Text(
                    widget.numbers,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey.shade500
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
