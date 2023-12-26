import 'package:car_app/ui/widgets/makes_page_widgets/carousel.dart';
import 'package:flutter/widgets.dart';

class CarouselBuildWidget extends StatelessWidget {
  const CarouselBuildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: <Widget>[
          const CarsCarousel(),
          Positioned.fill(
            child: IgnorePointer(
              ignoring: true,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0),
                      Color.fromRGBO(0, 0, 0, 0.623),
                      Color.fromRGBO(0, 0, 0, 1),
                    ],
                    stops: [0.75, 0.91, 0.96],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
