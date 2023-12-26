import 'package:car_app/domain_models/vehicle_make_model.dart';
import 'package:equatable/equatable.dart';

abstract class VehicleMakeState extends Equatable {
  const VehicleMakeState();

  @override
  List<Object?> get props => [];
}

class VehicleMakeInitial extends VehicleMakeState {
  const VehicleMakeInitial();

  @override
  List<Object?> get props => [];
}

class VehicleMakeLoading extends VehicleMakeState {
  const VehicleMakeLoading();

  @override
  List<Object?> get props => [];
}

class VehicleMakeLoaded extends VehicleMakeState {
  final List<VehicleMakeModel> data;

  const VehicleMakeLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class VehicleMakeError extends VehicleMakeState {
  const VehicleMakeError();

  @override
  List<Object?> get props => [];
}
