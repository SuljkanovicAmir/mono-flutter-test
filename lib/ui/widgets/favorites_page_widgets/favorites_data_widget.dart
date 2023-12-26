import 'package:car_app/domain_models/car_favorite_model.dart';
import 'package:flutter/material.dart';

class FavoritesDataWidget extends StatelessWidget {
  final CarFavoriteModel favorite;
  const FavoritesDataWidget(this.favorite, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/details', arguments: {
              'modelId': favorite.modelId,
              'makeId': favorite.makeId,
              'modelName': favorite.modelName,
              'makeName': favorite.makeName,
            });
          },
          child: ListTile(
            title: Text('Model: ${favorite.modelName}'),
            subtitle: Text('Make: ${favorite.makeName}'),
            trailing: const Icon(Icons.navigate_next_rounded),
          ),
        ),
      ),
    );
  }
}
