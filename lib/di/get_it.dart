import 'package:car_app/car_api/car_api.dart';
import 'package:car_app/cubit/favorites/favorites_cubit.dart';
import 'package:car_app/cubit/vin/vin_cubit.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<VehicleMakeService>(() => VehicleMakeService());
  getIt.registerLazySingleton<VehicleModelService>(() => VehicleModelService());
  getIt.registerLazySingleton<VehicleBodyService>(() => VehicleBodyService());
  getIt.registerLazySingleton<VinDecoderService>(() => VinDecoderService());
  getIt.registerLazySingleton<FavoritesService>(() => FavoritesService());

  getIt.registerLazySingleton<VehicleMakeRepository>(
      () => VehicleMakeRepository());
  getIt.registerLazySingleton<VehicleModelRepository>(
      () => VehicleModelRepository());
  getIt.registerLazySingleton<VehicleBodyRepository>(
      () => VehicleBodyRepository());
  getIt.registerFactory<FavoritesRepository>(() => FavoritesRepository());

  getIt.registerLazySingleton<VinDecoderRepository>(
      () => VinDecoderRepository());
  getIt.registerFactory<VinDecoderCubit>(() => VinDecoderCubit());
  getIt.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit());
}
