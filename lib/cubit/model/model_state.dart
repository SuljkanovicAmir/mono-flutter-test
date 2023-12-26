import 'package:car_app/domain_models/vehicle_model_model.dart';
import 'package:equatable/equatable.dart';

abstract class VehicleModelState extends Equatable {
  const VehicleModelState();

  @override
  List<Object?> get props => [];
}

class VehicleModelInitial extends VehicleModelState {
  const VehicleModelInitial();

  @override
  List<Object?> get props => [];
}

class VehicleModelLoading extends VehicleModelState {
  const VehicleModelLoading();

  @override
  List<Object?> get props => [];
}

class VehicleModelLoaded extends VehicleModelState {
  final List<VehicleModelModel> data;

  const VehicleModelLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class VehicleModelError extends VehicleModelState {
  const VehicleModelError();

  @override
  List<Object?> get props => [];
}
