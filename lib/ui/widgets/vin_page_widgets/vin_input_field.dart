import 'package:flutter/material.dart';

class VinInputField extends StatelessWidget {
  final TextEditingController controller;

  const VinInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Enter VIN',
        helperText: 'VINs for 2015-2020 models only.',
        helperStyle: TextStyle(color: Color.fromARGB(255, 218, 218, 218)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 134, 134, 134),
          fontSize: 16,
        ),
      ),
    );
  }
}
