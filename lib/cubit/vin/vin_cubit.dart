import 'package:car_app/cubit/vin/vin_state.dart';
import 'package:car_app/di/get_it.dart';
import 'package:car_app/main.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VinDecoderCubit extends Cubit<VinDecoderState> {
  VinDecoderRepository repository = getIt.get<VinDecoderRepository>();

  VinDecoderCubit() : super(const VinDecoderInitial());

  Future<void> fetchVehicleModels(vin) async {
    try {
      emit(const VinDecoderLoading());
      final vinData = await repository.fetchVinDecoder(vin);
      emit(VinDecoderLoaded(vinData));
    } catch (e) {
      emit(const VinDecoderError());
      logger.e('Failed to fetch vehicle vin: $e');
    }
  }
}
