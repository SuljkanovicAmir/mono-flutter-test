import 'package:car_app/cubit/favorites/favorites_cubit.dart';
import 'package:car_app/di/get_it.dart';
import 'package:car_app/domain_models/car_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesButton extends StatefulWidget {
  const FavoritesButton({
    super.key,
    required this.modelId,
    required this.makeId,
    required this.modelName,
    required this.makeName,
  });

  final String modelId;
  final String makeId;
  final String modelName;
  final String makeName;

  @override
  State<FavoritesButton> createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  late CarFavoriteModel favoriteData;
  late String buttonText = 'Add to favorites';
  late String snackText = '';

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    favoriteData = CarFavoriteModel(
      modelId: widget.modelId,
      makeId: widget.makeId,
      modelName: widget.modelName,
      makeName: widget.makeName,
    );

    await checkDataInFavorites();
  }

  Future<void> checkDataInFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? existingData = prefs.getStringList('favorites');

    bool exists = false;

    if (existingData != null) {
      exists = existingData.any(
        (data) => CarFavoriteModel.decodeFromJson(data) == favoriteData,
      );
      setState(() {
        buttonText = exists ? 'Remove from Favorites' : 'Add to Favorites';
        snackText = exists ? 'Removed from Favorites' : 'Added to Favorites';
      });
    }
  }

  Future<bool> toggleFavorite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> existingData = prefs.getStringList('favorites') ?? [];

    final bool exists = existingData.any(
      (data) => CarFavoriteModel.decodeFromJson(data) == favoriteData,
    );

    setState(() {
      buttonText = exists ? 'Add to Favorites' : 'Remove from Favorites';
      snackText = exists ? 'Removed from Favorites' : 'Added to Favorites';
    });

    if (exists) {
      existingData.remove(favoriteData.encodeToJson());
    } else {
      existingData.add(favoriteData.encodeToJson());
    }

    await prefs.setStringList('favorites', existingData);
    return exists;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                toggleFavorite().then((value) {
                  getIt.get<FavoritesCubit>().fetchFavorites();
                  if (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(snackText)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(snackText)),
                    );
                  }
                });
              },
              style: ButtonStyle(
                fixedSize:
                    MaterialStateProperty.all(const Size(double.infinity, 50)),
                maximumSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(250, 29, 29, 29)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Color.fromARGB(48, 0, 0, 0)),
                )),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Color.fromARGB(180, 255, 255, 255), fontSize: 18),
              ),
            )));
  }
}
