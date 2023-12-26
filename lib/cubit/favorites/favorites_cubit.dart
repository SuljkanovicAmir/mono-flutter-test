import 'package:car_app/cubit/favorites/favorites_state.dart';
import 'package:car_app/di/get_it.dart';
import 'package:car_app/repository/vehicles_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesRepository repository = getIt.get<FavoritesRepository>();

  FavoritesCubit() : super(const FavoritesInitial()) {
    fetchFavorites();
  }
  Future<void> fetchFavorites() async {
    try {
      emit(const FavoritesLoading());

      final favorites = await repository.fetchFavoritesData();

      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(const FavoritesError('Failed to load favorites'));
    }
  }
}
