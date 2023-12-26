import 'package:car_app/cubit/body/body_cubit.dart';
import 'package:car_app/cubit/body/body_state.dart';
import 'package:car_app/ui/widgets/details_page_widgets/body_loaded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyDetailsWidget extends StatelessWidget {
  const BodyDetailsWidget({
    super.key,
    required this.modelId,
    required this.makeId,
  });

  final String modelId;
  final String makeId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: BlocBuilder<VehicleBodyCubit, VehicleBodyState>(
          builder: (context, state) {
        if (state is VehicleBodyInitial) {
          context.read<VehicleBodyCubit>().fetchVehicleModels(modelId, makeId);
          return const SizedBox(
            height: 70,
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 117, 117, 117),
              ),
            ),
          );
        }
        if (state is VehicleBodyLoading) {
          return const SizedBox(
            height: 70,
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 117, 117, 117),
              ),
            ),
          );
        }
        if (state is VehicleBodyError) {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'No data for this vehicle.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        if (state is VehicleBodyLoaded) {
          final vehicleBody = state.data;
          return BodyLoaded(vehicleBody);
        }
        return Container(
          height: 70,
        );
      }),
    );
  }
}
