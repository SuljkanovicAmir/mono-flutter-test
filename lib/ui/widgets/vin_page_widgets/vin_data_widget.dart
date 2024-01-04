import 'package:car_app/cubit/vin/vin_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VinDataSection extends StatelessWidget {
  final VinDecoderLoaded state;

  const VinDataSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(null, state.data.modelName, FontWeight.bold, 20),
              buildText(null, state.data.makeName, FontWeight.bold, 20),
            ],
          ),
          const Divider(),
          Text(
            'Details:',
            style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
          ),
          const SizedBox(height: 7),
          buildText('Year:', state.data.year.toString()),
          buildText('Trim:', state.data.trim),
          buildText('Number of doors:', state.data.doors),
          buildText('Number of engine cylinders:', state.data.engine),
          buildText('Fuel type:', state.data.fuel),
          buildText('Manufacturer name:', state.data.manufacturerName),
          const SizedBox(height: 14),
          Text(
            'Manufacturing Plant Details:',
            style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
          ),
          const SizedBox(height: 7),
          buildText('City:', state.data.plantCity),
          buildText('Company:', state.data.plantCompanyName),
          buildText('State:', state.data.plantState),
          buildText('Country:', state.data.plantCountry),
        ],
      ),
    );
  }

  Widget buildText(String? label, String value,
      [FontWeight? weight, double? size]) {
    return Text.rich(
      TextSpan(
        children: [
          if (label != null && label.isNotEmpty)
            TextSpan(
              text: '$label ',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: weight ?? FontWeight.normal,
                  fontSize: size ?? 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          TextSpan(
            text: value,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontWeight: weight ?? FontWeight.normal,
                fontSize: size ?? 14,
                color: const Color.fromARGB(220, 0, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
