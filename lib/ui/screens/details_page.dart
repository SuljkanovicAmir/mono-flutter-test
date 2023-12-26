import 'package:car_app/cubit/body/body_cubit.dart';
import 'package:car_app/ui/widgets/details_page_widgets/body_widget.dart';
import 'package:car_app/ui/widgets/details_page_widgets/details_page_content.dart';
import 'package:car_app/ui/widgets/details_page_widgets/favorites_button.dart';
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
                  create: (context) => VehicleBodyCubit(),
                  child: BodyDetailsWidget(modelId: modelId, makeId: makeId),
                ),
                const RandomNumberPage(),
                const DetailsContent(),
              ],
            ))),
            FavoritesButton(
                modelId: modelId,
                makeId: makeId,
                modelName: modelName,
                makeName: makeName)
          ],
        ));
  }
}
