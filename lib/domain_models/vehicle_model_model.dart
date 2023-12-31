import 'package:equatable/equatable.dart';

class VehicleModelModel extends Equatable {
  final int id;
  final String name;
  final String abrv;
  final int makeId;

  const VehicleModelModel({
    required this.id,
    required this.name,
    required this.abrv,
    required this.makeId,
  });

  factory VehicleModelModel.fromJson(Map<String, dynamic> json) {
    return VehicleModelModel(
      id: json['id'],
      name: json['name'] ?? '',
      abrv: json['abrv'] ?? '',
      makeId: json['make_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abrv'] = abrv;
    data['make_id'] = makeId;
    return data;
  }

  @override
  List<Object?> get props => [id, name, abrv, makeId];
}
