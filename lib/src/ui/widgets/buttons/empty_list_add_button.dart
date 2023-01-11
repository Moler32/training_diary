import 'package:flutter/material.dart';

class EmptyListAddButton extends StatelessWidget {
  const EmptyListAddButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
