import 'package:car_app/car_api/car_api.dart';
import 'package:car_app/di.dart';
import 'package:car_app/domain_models/vehicle_body_model.dart';
import 'package:car_app/domain_models/vehicle_make_model.dart';
import 'package:car_app/domain_models/vehicle_model_model.dart';

class VehicleMakeRepository {
  final VehicleMakeService _makeService = getIt.get<VehicleMakeService>();

  Future<List<VehicleMakeModel>> fetchVehicleMakes({
    int page = 1,
    String direction = 'asc',
  }) async {
    return await _makeService.fetchVehicleMakes(
      page: page,
      direction: direction,
    );
  }
}

class VehicleModelRepository {
  final VehicleModelService _modelService = getIt.get<VehicleModelService>();

  Future<List<VehicleModelModel>> fetchVehicleModels(String makeId) async {
    return await _modelService.fetchVehicleModels(makeId);
  }
}

class VehicleBodyRepository {
  final VehicleBodyService _bodyService = getIt.get<VehicleBodyService>();

  Future<List<VehicleBodyModel>> fetchVehicleBody(
      String modelId, String makeId) async {
    return await _bodyService.fetchVehicleBody(modelId, makeId);
  }
}
