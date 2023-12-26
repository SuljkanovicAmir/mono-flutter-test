import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        margin: const EdgeInsets.only(bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Explore Quality Cars for Every Journey:',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ))),
            const SizedBox(
              height: 15,
            ),
            Text(
                "Discover a diverse range of reliable, well-maintained vehicles designed to elevate your travel experience. From compact cars to spacious SUVs, we've got the perfect ride for your next adventure.",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: Color.fromARGB(190, 255, 255, 255),
                  fontSize: 14,
                ))),
            const SizedBox(
              height: 30,
            ),
            Text('Comfort, Safety, & Convenience:',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ))),
            const SizedBox(
              height: 15,
            ),
            Text(
                "Enjoy a seamless driving experience with our cars equipped with modern features, advanced safety technology, and exceptional comfort. Your safety and satisfaction are our top priorities.",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: Color.fromARGB(190, 255, 255, 255),
                  fontSize: 14,
                ))),
          ],
        ));
  }
}
