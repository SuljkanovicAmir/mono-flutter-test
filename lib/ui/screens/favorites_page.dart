import 'package:car_app/cubit/favorites/favorites_cubit.dart';
import 'package:car_app/cubit/favorites/favorites_state.dart';
import 'package:car_app/di/get_it.dart';
import 'package:car_app/domain_models/car_favorite_model.dart';
import 'package:car_app/ui/widgets/favorites_page_widgets/favorites_data_widget.dart';
import 'package:car_app/ui/widgets/appbar_widget.dart';
import 'package:car_app/ui/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritesPage extends StatelessWidget {
  MyFavoritesPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBarWidget(_scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  'Favorites',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                )),
            BlocBuilder<FavoritesCubit, FavoritesState>(
              bloc: getIt.get<FavoritesCubit>(),
              builder: (context, state) {
                if (state is FavoritesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FavoritesError) {
                  return const Center(child: Text('Error fetching data'));
                } else if (state is FavoritesLoaded) {
                  final List<CarFavoriteModel> favorites = state.favorites;
                  if (favorites.isEmpty) {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                          child: Text(
                        'No favorites available',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: favorites.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final favorite = favorites[index];

                        return FavoritesDataWidget(favorite);
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
