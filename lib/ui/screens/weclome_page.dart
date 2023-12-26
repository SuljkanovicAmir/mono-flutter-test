import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).orientation == Orientation.portrait
                ? 250
                : 20,
            left: MediaQuery.of(context).orientation == Orientation.portrait
                ? 15
                : 150,
            right: 15,
            child: Container(
              color: const Color.fromARGB(0, 255, 255, 255),
              height: 500,
              child: Image.asset(
                'assets/cars/car.jpg',
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 500
                        : 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).orientation == Orientation.portrait
                ? 110
                : 50,
            left: MediaQuery.of(context).orientation == Orientation.portrait
                ? 15
                : 30,
            right: MediaQuery.of(context).orientation == Orientation.portrait
                ? 15
                : 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Premium Cars For',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(180, 255, 255, 255),
                        letterSpacing: 0.2,
                        height: 1),
                  ),
                ),
                const Text(
                  'Rent',
                  style: TextStyle(
                      fontSize: 80.0,
                      fontFamily: 'Portico',
                      color: Color.fromARGB(180, 255, 255, 255),
                      height: 1),
                ),
                const SizedBox(height: 10),
                Text(
                  'Embark on your next journey, find the perfect ride with our intuitive car rental platform, effortlessly reserve, drive, and explore at your own pace!',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 12.0,
                      color: Color.fromARGB(140, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Color.fromARGB(200, 255, 255, 255))),
                    minimumSize: MaterialStateProperty.all(const Size(150, 40)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/makes',
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Let's Go",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(220, 255, 255, 255),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next_outlined,
                        color: Color.fromARGB(220, 255, 255, 255),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
