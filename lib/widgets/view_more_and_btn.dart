import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewMoreRowBtn extends StatelessWidget {
  final String text;
  final Function function;
  const ViewMoreRowBtn({Key? key, required this.text, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () => function(),
          child: const Text(
            'View More',
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xffFC7753),
            ),
          ),
        ),
      ],
    );
  }
}
