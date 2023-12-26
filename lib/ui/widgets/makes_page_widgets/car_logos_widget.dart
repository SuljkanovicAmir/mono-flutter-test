import 'package:flutter/widgets.dart';

class CarLogoWidget extends StatelessWidget {
  final Map<String, dynamic> carLogo;

  const CarLogoWidget({required this.carLogo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final makeName = carLogo['name'];
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/models', arguments: {
          'makeId': carLogo['makeId'],
          'makeName': makeName,
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 206, 206, 206),
              Color.fromARGB(255, 147, 147, 147),
              Color.fromARGB(255, 91, 91, 91),
            ],
            stops: [0.3, 0.6, 1],
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  carLogo['imgSrc'],
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                carLogo['name'],
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
