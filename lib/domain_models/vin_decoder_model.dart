import 'package:equatable/equatable.dart';

class VinDecodedModel extends Equatable {
  final String modelName;
  final String makeName;
  final String trim;
  final String fuel;
  final String plantCity;
  final String plantCompanyName;
  final String plantCountry;
  final String plantState;
  final String manufacturerName;
  final String engine;
  final int year;
  final String doors;

  const VinDecodedModel(
      {required this.modelName,
      required this.makeName,
      required this.trim,
      required this.plantCity,
      required this.plantCompanyName,
      required this.plantCountry,
      required this.plantState,
      required this.fuel,
      required this.year,
      required this.manufacturerName,
      required this.doors,
      required this.engine});

  factory VinDecodedModel.fromJson(Map<String, dynamic> json) {
    return VinDecodedModel(
        year: json['year'] ?? 0,
        modelName: json['model'] ?? 'N/A',
        makeName: json['make'] ?? 'N/A',
        trim: json['trim'] ?? 'N/A',
        manufacturerName: json['specs']['manufacturer_name'] ?? 'N/A',
        plantCity: json['specs']['plant_city'] ?? 'N/A',
        plantCompanyName: json['specs']['plant_company_name'] ?? 'N/A',
        plantCountry: json['specs']['plant_country'] ?? 'N/A',
        plantState: json['specs']['plant_state'] ?? 'N/A',
        fuel: json['specs']['fuel_type_primary'] ?? 'N/A',
        doors: json['specs']['doors'] ?? 'N/A',
        engine: json['specs']['engine_number_of_cylinders'] ?? 'N/A');
  }

  @override
  List<Object?> get props => [
        modelName,
        makeName,
        trim,
        plantCity,
        plantCompanyName,
        plantCountry,
        plantState,
        year,
        doors,
        engine
      ];
}
