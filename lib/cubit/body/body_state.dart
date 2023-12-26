import 'package:car_app/domain_models/vehicle_body_model.dart';
import 'package:equatable/equatable.dart';

abstract class VehicleBodyState extends Equatable {
  const VehicleBodyState();

  @override
  List<Object?> get props => [];
}

class VehicleBodyInitial extends VehicleBodyState {
  const VehicleBodyInitial();

  @override
  List<Object?> get props => [];
}

class VehicleBodyLoading extends VehicleBodyState {
  const VehicleBodyLoading();

  @override
  List<Object?> get props => [];
}

class VehicleBodyLoaded extends VehicleBodyState {
  final List<VehicleBodyModel> data;

  const VehicleBodyLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class VehicleBodyError extends VehicleBodyState {
  const VehicleBodyError();

  @override
  List<Object?> get props => [];
}
