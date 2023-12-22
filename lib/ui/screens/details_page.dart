import 'package:car_app/cubit/body_cubit.dart';
import 'package:car_app/di.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:car_app/ui/widgets/body_widget.dart';
import 'package:car_app/ui/widgets/random_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(this.modelId, this.makeId, this.modelName, this.makeName,
      {super.key});
  final String modelId;
  final String makeId;
  final String modelName;
  final String makeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 0, 0, 0),
              shadows: [
                Shadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    offset: Offset(2, 0))
              ]),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        body: Stack(
          children: [
            SizedBox.expand(
                child: SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 240, 240, 240),
                        Color.fromARGB(255, 108, 108, 108),
                        Color.fromARGB(255, 0, 0, 0)
                      ],
                      stops: [0.3, 0.7, 1],
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                          child: Transform.flip(
                              flipX: true,
                              child: Image.asset(
                                'assets/logos/details_template.png',
                                height: 250,
                                width: 250,
                                fit: BoxFit.contain,
                              ))),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          makeName,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(190, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          modelName.toUpperCase(),
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                          )),
                        ),
                      ],
                    )),
                BlocProvider(
                  create: (context) => VehicleBodyCubit(
                    getIt.get<VehicleBodyRepository>(),
                  ),
                  child: BodyDetailsWidget(modelId: modelId, makeId: makeId),
                ),
                const RandomNumberPage(),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
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
                    )),
              ],
            ))),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 50),
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(245, 19, 19, 19)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0)),
                        )),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                            color: Color.fromARGB(180, 255, 255, 255),
                            fontSize: 18),
                      ),
                    )))
          ],
        ));
  }
}
