import 'package:car_app/car_api/car_api.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<VehicleMakeService>(() => VehicleMakeService());
  getIt.registerLazySingleton<VehicleModelService>(() => VehicleModelService());
  getIt.registerLazySingleton<VehicleBodyService>(() => VehicleBodyService());

  getIt.registerLazySingleton<VehicleMakeRepository>(
      () => VehicleMakeRepository());
  getIt.registerLazySingleton<VehicleModelRepository>(
      () => VehicleModelRepository());
  getIt.registerLazySingleton<VehicleBodyRepository>(
      () => VehicleBodyRepository());
}
