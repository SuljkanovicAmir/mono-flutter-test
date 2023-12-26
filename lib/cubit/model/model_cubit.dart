import 'package:car_app/cubit/model/model_state.dart';
import 'package:car_app/di/get_it.dart';
import 'package:car_app/main.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleModelCubit extends Cubit<VehicleModelState> {
  final VehicleModelRepository repository = getIt.get<VehicleModelRepository>();

  VehicleModelCubit() : super(const VehicleModelInitial());

  Future<void> fetchVehicleModels(makeId) async {
    try {
      emit(const VehicleModelLoading());

      final vehicleModels = await repository.fetchVehicleModels(makeId);
      emit(VehicleModelLoaded(vehicleModels));
    } catch (e) {
      logger.e('Failed to fetch vehicle model: $e');
    }
  }
}
