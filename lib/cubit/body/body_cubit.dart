import 'package:car_app/cubit/body/body_state.dart';
import 'package:car_app/di/get_it.dart';
import 'package:car_app/main.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleBodyCubit extends Cubit<VehicleBodyState> {
  final VehicleBodyRepository repository = getIt.get<VehicleBodyRepository>();

  VehicleBodyCubit() : super(const VehicleBodyInitial());

  Future<void> fetchVehicleModels(String modelId, String makeId) async {
    try {
      emit(const VehicleBodyLoading());
      final vehicleBody = await repository.fetchVehicleBody(modelId, makeId);
      emit(VehicleBodyLoaded(vehicleBody));
    } catch (e) {
      emit(const VehicleBodyError());
      logger.e('Failed to fetch vehicle body: $e');
    }
  }
}
