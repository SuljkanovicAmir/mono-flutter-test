import 'dart:convert';
import 'package:car_app/domain_models/vehicle_body_model.dart';
import 'package:car_app/domain_models/vehicle_make_model.dart';
import 'package:car_app/domain_models/vehicle_model_model.dart';
import 'package:http/http.dart' as http;

class VehicleMakeService {
  Future<List<VehicleMakeModel>> fetchVehicleMakes({
    required int page,
    String direction = 'asc',
  }) async {
    final response = await http.get(Uri.parse(
        'https://carapi.app/api/makes?page=$page&limit=10&sort=name&direction=$direction&year=2020'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final List<dynamic> results = responseBody['data'];

      final List<VehicleMakeModel> vehicleMakes = results
          .map((dynamic item) => VehicleMakeModel.fromJson(item))
          .toList();

      return vehicleMakes;
    } else {
      print('Response Body: ${response.body}');
      throw Exception('Failed to load vehicle makes');
    }
  }
}

class VehicleModelService {
  Future<List<VehicleModelModel>> fetchVehicleModels(String makeId) async {
    final response = await http.get(
        Uri.parse('https://carapi.app/api/models?year=2020&make_id=$makeId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final List<dynamic> results = responseBody['data'];

      final List<VehicleModelModel> vehicleModels = results
          .map((dynamic item) => VehicleModelModel.fromJson(item))
          .toList();

      return vehicleModels;
    } else {
      print('Response Body: ${response.body}');
      throw Exception('Failed to load vehicle models');
    }
  }
}

class VehicleBodyService {
  Future<List<VehicleBodyModel>> fetchVehicleBody(
      String modelId, String makeId) async {
    final response = await http.get(Uri.parse(
        'https://carapi.app/api/bodies?make_model_id=$modelId&make_id=$makeId&year=2020'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final List<dynamic> results = responseBody['data'];

      final List<VehicleBodyModel> vehiclesBody = results
          .map((dynamic item) => VehicleBodyModel.fromJson(item))
          .toList();
      print(vehiclesBody);
      return vehiclesBody;
    } else {
      print('Response Body: ${response.body}');
      throw Exception('Failed to load vehicle body');
    }
  }
}
