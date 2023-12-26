import 'package:car_app/cubit/model/model_cubit.dart';
import 'package:car_app/cubit/model/model_state.dart';
import 'package:car_app/ui/widgets/models_page_widgets/models_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: Center(child: BlocBuilder<VehicleModelCubit, VehicleModelState>(
            builder: (context, state) {
          if (state is VehicleModelInitial) {
            context.read<VehicleModelCubit>().fetchVehicleModels(widget.makeId);
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          }
          if (state is VehicleModelLoaded) {
            return ModelsList(
                models: state.data,
                makeId: widget.makeId,
                makeName: widget.makeName);
          }
          if (state is VehicleModelError) {
            return const Text('No Data');
          }
          if (state is VehicleModelLoading) {
            const SizedBox(
              height: 200,
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              )),
            );
          }
          return Container();
        })));
  }
}
