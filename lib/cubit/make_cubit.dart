import 'package:car_app/domain_models/vehicle_make_model.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleMakeCubit extends Cubit<List<VehicleMakeModel>> {
  final VehicleMakeRepository repository;
  int currentPage = 1; // Track the current page

  VehicleMakeCubit(this.repository) : super([]);

  Future<void> fetchVehicleMakes(
      {bool isRefresh = false, required int page}) async {
    if (isRefresh) {
      currentPage = 1;
    }

    try {
      final vehicleMakes = await repository.fetchVehicleMakes(
        page: currentPage,
        direction: 'asc',
      );

      if (isRefresh) {
        emit(vehicleMakes);
      } else {
        emit([...state, ...vehicleMakes]);
      }

      currentPage++;
    } catch (e) {
      print('Failed to fetch vehicle makes: $e');
    }
  }
}
