import 'package:car_app/cubit/make/make_cubit.dart';
import 'package:car_app/cubit/model/model_cubit.dart';
import 'package:car_app/ui/screens/details_page.dart';
import 'package:car_app/ui/screens/make_page.dart';
import 'package:car_app/ui/screens/models_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  if (settings.name == '/makes') {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return BlocProvider(
          create: (context) => VehicleMakeCubit(),
          child: const MakesPage(),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  if (settings.name == '/models') {
    final Map<String, dynamic> args =
        settings.arguments as Map<String, dynamic>;

    final makeId = args['makeId'].toString();
    final makeName = args['makeName'].toString();

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return BlocProvider(
          create: (context) => VehicleModelCubit(),
          child: ModelsPage(makeId, makeName),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
  if (settings.name == '/details') {
    final Map<String, dynamic> args =
        settings.arguments as Map<String, dynamic>;
    final modelId = args['modelId'].toString();
    final makeId = args['makeId'].toString();
    final modelName = args['modelName'];
    final makeName = args['makeName'];

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return DetailsPage(modelId, makeId, modelName, makeName);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  return null;
}
