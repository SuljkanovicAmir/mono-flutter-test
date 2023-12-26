import 'package:equatable/equatable.dart';

class VehicleMakeModel extends Equatable {
  final int id;
  final String name;
  final String abrv;

  const VehicleMakeModel({
    required this.id,
    required this.name,
    required this.abrv,
  });

  factory VehicleMakeModel.fromJson(Map<String, dynamic> json) {
    return VehicleMakeModel(
      id: json['id'],
      name: json['name'] ?? '',
      abrv: json['abrv'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abrv'] = abrv;
    return data;
  }

  @override
  List<Object?> get props => [id, name, abrv];
}
