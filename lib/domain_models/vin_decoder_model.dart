import 'package:equatable/equatable.dart';

class VinDecodedModel extends Equatable {
  final int modelId;
  final int makeId;
  final String modelName;
  final String makeName;

  const VinDecodedModel(
      {required this.modelId,
      required this.modelName,
      required this.makeId,
      required this.makeName});

  factory VinDecodedModel.fromJson(Map<String, dynamic> json) {
    return VinDecodedModel(
      modelId: json['trims'][0]['make_model_id'] ?? 0,
      modelName: json['trims'][0]['make_model']['name'] ?? '',
      makeId: json['trims'][0]['make_model']['make']['id'] ?? 0,
      makeName: json['trims'][0]['make_model']['make']['name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [modelId, makeId, modelName, makeName];
}
