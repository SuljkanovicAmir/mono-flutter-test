import 'package:car_app/domain_models/vehicle_model_model.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleModelCubit extends Cubit<List<VehicleModelModel>> {
  final VehicleModelRepository repository;

  VehicleModelCubit(this.repository) : super([]);

  Future<void> fetchVehicleModels(makeId) async {
    try {
      final vehicleModels = await repository.fetchVehicleModels(makeId);
      emit(vehicleModels);
    } catch (e) {
      print('Failed to fetch vehicle model: $e');
    }
  }
}
