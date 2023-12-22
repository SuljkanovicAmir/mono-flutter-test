class VehicleBodyModel {
  final String type;
  final String width;
  final String height;
  final String length;
  final int seats;
  final int doors;

  VehicleBodyModel({
    required this.type,
    required this.width,
    required this.length,
    required this.height,
    required this.seats,
    required this.doors,
  });

  factory VehicleBodyModel.fromJson(Map<String, dynamic> json) {
    return VehicleBodyModel(
      type: json['type'] ?? '',
      width: json['width'] ?? '0',
      height: json['height'] ?? '0',
      length: json['length'] ?? '0',
      doors: json['doors'] ?? 0,
      seats: json['seats'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['width'] = width;
    data['height'] = height;
    data['length'] = length;
    data['doors'] = doors;
    data['seats'] = seats;

    return data;
  }
}
