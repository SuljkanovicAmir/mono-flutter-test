import 'package:car_app/cubit/make/make_state.dart';
import 'package:car_app/di/get_it.dart';
import 'package:car_app/main.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleMakeCubit extends Cubit<VehicleMakeState> {
  final VehicleMakeRepository repository = getIt.get<VehicleMakeRepository>();

  VehicleMakeCubit() : super(const VehicleMakeInitial());

  Future<void> fetchVehicleMakes() async {
    try {
      emit(const VehicleMakeLoading());
      final vehicleMakes = await repository.fetchVehicleMakes();

      emit(VehicleMakeLoaded(vehicleMakes));
    } catch (e) {
      emit(const VehicleMakeError());
      logger.e('Failed to fetch vehicle makes: $e');
    }
  }
}
