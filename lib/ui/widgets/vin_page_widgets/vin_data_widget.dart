import 'package:car_app/cubit/vin/vin_state.dart';
import 'package:flutter/material.dart';

class VinDataSection extends StatelessWidget {
  final VinDecoderLoaded state;

  const VinDataSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 194, 194, 194),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.data.makeName,
                style: const TextStyle(
                  color: Color.fromARGB(189, 0, 0, 0),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                state.data.modelName.toUpperCase(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
