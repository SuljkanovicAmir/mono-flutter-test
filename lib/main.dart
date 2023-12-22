import 'package:car_app/cubit/make_cubit.dart';
import 'package:car_app/cubit/model_cubit.dart';
import 'package:car_app/di.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:car_app/ui/screens/make_page.dart';
import 'package:car_app/ui/screens/models_page.dart';
import 'package:car_app/ui/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/screens/home_page.dart';

void main() {
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarApp',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.black),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/makes') {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => VehicleMakeCubit(
                getIt.get<VehicleMakeRepository>(),
              ),
              child: const MakesPage(), // Add a generic widget as a child
            ),
          );
        }
        if (settings.name == '/models') {
          final Map<String, dynamic> args =
              settings.arguments as Map<String, dynamic>;

          final makeId = args['makeId'].toString();
          final makeName = args['makeName'].toString();
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => VehicleModelCubit(
                getIt.get<VehicleModelRepository>(),
              ),
              child: ModelsPage(makeId, makeName),
            ),
          );
        }
        if (settings.name == '/details') {
          final Map<String, dynamic> args =
              settings.arguments as Map<String, dynamic>;
          final modelId = args['modelId'].toString();
          final makeId = args['makeId'].toString();
          final modelName = args['modelName'];
          final makeName = args['makeName'];

          return MaterialPageRoute(
            builder: (context) =>
                DetailsPage(modelId, makeId, modelName, makeName),
          );
        }

        return null;
      },
      home: const MyHomePage(),
    );
  }
}
