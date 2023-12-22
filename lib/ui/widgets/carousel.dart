import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CarsCarousel extends StatelessWidget {
  const CarsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> carImages = [
      'assets/cars/car1.jpg',
      'assets/cars/car2.jpg',
      'assets/cars/car3.jpg',
      'assets/cars/car4.jpg',
      'assets/cars/car5.jpg',
      'assets/cars/car6.jpg',
    ];

    return FlutterCarousel(
      options: CarouselOptions(
        height: 590,
        viewportFraction: 1.0,
        showIndicator: true,
        slideIndicator: const CircularSlideIndicator(
            padding: EdgeInsets.only(bottom: 40),
            currentIndicatorColor: Colors.white,
            indicatorBorderColor: Color.fromARGB(255, 255, 255, 255),
            indicatorBorderWidth: 1,
            indicatorRadius: 5),
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOut,
      ),
      items: carImages.map((car) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            car, // Provide the asset path for each image
            fit: BoxFit.cover,
            height: 590,
            width: MediaQuery.of(context).size.width,
          ),
        );
      }).toList(),
    );
  }
}
