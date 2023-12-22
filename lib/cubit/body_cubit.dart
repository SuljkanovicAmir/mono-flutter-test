import 'package:car_app/domain_models/vehicle_body_model.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleBodyCubit extends Cubit<List<VehicleBodyModel>> {
  final VehicleBodyRepository repository;

  VehicleBodyCubit(this.repository) : super([]);

  Future<void> fetchVehicleModels(String modelId, String makeId) async {
    try {
      final vehicleBody = await repository.fetchVehicleBody(modelId, makeId);
      emit(vehicleBody);
    } catch (e) {
      // Handle error if needed
      print('Failed to fetch vehicle body: $e');
    }
  }
}
