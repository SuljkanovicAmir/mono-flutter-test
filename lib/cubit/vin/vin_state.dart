import 'package:car_app/domain_models/vin_decoder_model.dart';
import 'package:equatable/equatable.dart';

abstract class VinDecoderState extends Equatable {
  const VinDecoderState();

  @override
  List<Object?> get props => [];
}

class VinDecoderInitial extends VinDecoderState {
  const VinDecoderInitial();

  @override
  List<Object?> get props => [];
}

class VinDecoderLoading extends VinDecoderState {
  const VinDecoderLoading();

  @override
  List<Object?> get props => [];
}

class VinDecoderLoaded extends VinDecoderState {
  final VinDecodedModel data;

  const VinDecoderLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class VinDecoderError extends VinDecoderState {
  const VinDecoderError();

  @override
  List<Object?> get props => [];
}
