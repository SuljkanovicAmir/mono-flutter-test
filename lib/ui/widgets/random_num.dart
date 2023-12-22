import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({super.key});

  @override
  _RandomNumberPageState createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  late int randomNum;

  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    final random = Random();
    randomNum = 75 + random.nextInt(150);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price ',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              )),
            ),
            RichText(
                text: TextSpan(
              style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(190, 255, 255, 255)),
              children: [
                TextSpan(
                  text: '\$$randomNum',
                ),
                const TextSpan(
                  text: '/day',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(180, 255, 255, 255)),
                ),
              ],
            )),
          ],
        ));
  }
}
