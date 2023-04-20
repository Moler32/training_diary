import 'package:flutter/material.dart';

class LanguageMenuItem extends StatelessWidget {
  const LanguageMenuItem(
      {super.key,
      required this.image,
      required this.language,
      required this.title});

  final String image;
  final String title;
  final String language;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(image),
          ),
          Text(title),
        ],
      ),
    );
  }
}
