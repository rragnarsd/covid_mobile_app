import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CovidCaseCard extends StatelessWidget {
  final String text;
  final String numbers;

  CovidCaseCard({Key? key, required this.text, required this.numbers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      child: Container(decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ]
      ),
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
                    numbers,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    text,
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
