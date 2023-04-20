import 'package:flutter/material.dart';

class AddTextField extends StatelessWidget {
  const AddTextField(
      {super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        autofocus: true,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          fillColor: const Color.fromARGB(255, 88, 73, 26),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        controller: controller,
      ),
    );
  }
}
