import 'package:flutter/material.dart';

class VinErrorSection extends StatelessWidget {
  const VinErrorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          'Failed to fetch or decode VIN.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
