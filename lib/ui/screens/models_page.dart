import 'package:car_app/cubit/model_cubit.dart';
import 'package:car_app/domain_models/vehicle_model_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ModelsPage extends StatefulWidget {
  const ModelsPage(this.makeId, this.makeName, {super.key});
  final String makeId;
  final String makeName;
  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          automaticallyImplyLeading: true,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            '${widget.makeName} Models',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Center(
            child: BlocConsumer<VehicleModelCubit, List<VehicleModelModel>>(
                listener: (context, vehicleModels) {},
                builder: (context, vehicleModels) {
                  if (vehicleModels.isEmpty) {
                    context
                        .read<VehicleModelCubit>()
                        .fetchVehicleModels(widget.makeId);
                    return const CircularProgressIndicator();
                  } else {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: vehicleModels.length,
                        itemBuilder: (context, index) {
                          final modelId = vehicleModels[index].id.toString();
                          final modelName = vehicleModels[index].name;
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/details',
                                  arguments: {
                                    'modelId': modelId,
                                    'makeId': widget.makeId,
                                    'modelName': modelName,
                                    'makeName': widget.makeName,
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 28, 28, 28),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      vehicleModels[index].name,
                                      style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                      )),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                })));
  }
}
