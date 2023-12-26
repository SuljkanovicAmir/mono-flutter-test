import 'dart:convert';
import 'package:car_app/domain_models/car_favorite_model.dart';
import 'package:car_app/domain_models/vehicle_body_model.dart';
import 'package:car_app/domain_models/vehicle_make_model.dart';
import 'package:car_app/domain_models/vehicle_model_model.dart';
import 'package:car_app/domain_models/vin_decoder_model.dart';
import 'package:car_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VehicleMakeService {
  Future<List<VehicleMakeModel>> fetchVehicleMakes({
    String direction = 'asc',
  }) async {
    final response = await http.get(Uri.parse(
        'https://carapi.app/api/makes?sort=name&direction=$direction&year=2020'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final List<dynamic> results = responseBody['data'];

      final List<VehicleMakeModel> vehicleMakes = results
          .map((dynamic item) => VehicleMakeModel.fromJson(item))
          .toList();

      return vehicleMakes;
    } else {
      logger.e('Response Body: ${response.body}');
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
      logger.e('Response Body: ${response.body}');
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

      return vehiclesBody;
    } else {
      logger.e('Response Body: ${response.body}');
      throw Exception('Failed to load vehicle body');
    }
  }
}

class VinDecoderService {
  Future<VinDecodedModel> fetchVinDecoder(String vin) async {
    final response = await http.get(
      Uri.parse('https://carapi.app/api/vin/$vin?verbose=yes&all_trims=no'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final VinDecodedModel decodedData =
          VinDecodedModel.fromJson(responseBody);
      return decodedData;
    } else {
      logger.e('Response Body: ${response.body}');
      throw Exception('Failed to fetch or decode VIN');
    }
  }
}

class FavoritesService {
  Future<List<CarFavoriteModel>> fetchFavoritesData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? savedData = prefs.getStringList('favorites');

      if (savedData != null && savedData.isNotEmpty) {
        return savedData.map((data) {
          final Map<String, dynamic> jsonMap = json.decode(data);
          return CarFavoriteModel.fromJson(jsonMap);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      logger.e('Error fetching favorites: $e');
      rethrow;
    }
  }
}
