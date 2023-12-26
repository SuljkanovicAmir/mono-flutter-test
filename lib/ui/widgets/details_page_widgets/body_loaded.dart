import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyLoaded extends StatelessWidget {
  final dynamic vehicleBody;
  const BodyLoaded(
    this.vehicleBody, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 40, 40),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/car_type.svg',
                  width: 28,
                  height: 28,
                ),
                Text(vehicleBody[0].type,
                    style: const TextStyle(color: Colors.white))
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 40, 40),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/car_seat.svg',
                  width: 24,
                  height: 24,
                ),
                Text(vehicleBody[0].seats.toString(),
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 40, 40),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/car_door.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                Text(vehicleBody[0].doors.toString(),
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 40, 40),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.height,
                  color: Colors.white,
                ),
                Text(
                  vehicleBody[0].height,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 40, 40),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/width.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                Text(vehicleBody[0].width,
                    style: const TextStyle(color: Colors.white))
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            constraints: const BoxConstraints(minWidth: 80, minHeight: 80),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 40, 40),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/length.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                Text(vehicleBody[0].length,
                    style: const TextStyle(color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
