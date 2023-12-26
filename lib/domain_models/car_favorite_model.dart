import 'dart:convert';

import 'package:equatable/equatable.dart';

class CarFavoriteModel extends Equatable {
  final String modelId;
  final String makeId;
  final String modelName;
  final String makeName;

  const CarFavoriteModel({
    required this.modelId,
    required this.makeId,
    required this.modelName,
    required this.makeName,
  });

  factory CarFavoriteModel.fromJson(Map<String, dynamic> json) {
    return CarFavoriteModel(
      modelId: json['modelId'] ?? '',
      makeId: json['makeId'] ?? '',
      modelName: json['modelName'] ?? '',
      makeName: json['makeName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'modelId': modelId,
      'makeId': makeId,
      'modelName': modelName,
      'makeName': makeName,
    };
  }

  String encodeToJson() => json.encode(toJson());

  static CarFavoriteModel decodeFromJson(String jsonData) =>
      CarFavoriteModel.fromJson(json.decode(jsonData));

  @override
  List<Object?> get props => [modelId, makeId, modelName, makeName];
}
