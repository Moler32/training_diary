import 'package:flutter/material.dart';

class NegativeButton extends StatelessWidget {
  const NegativeButton({super.key, required this.onTap, required this.text});

  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: FilledButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xffe2e0d8))),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
