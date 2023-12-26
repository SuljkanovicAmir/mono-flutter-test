import 'package:car_app/domain_models/vehicle_model_model.dart';
import 'package:car_app/ui/widgets/models_page_widgets/models_item_widget.dart';
import 'package:flutter/widgets.dart';

class ModelsList extends StatelessWidget {
  const ModelsList({
    Key? key,
    required this.models,
    required this.makeId,
    required this.makeName,
  }) : super(key: key);

  final List<VehicleModelModel> models;
  final String makeId;
  final String makeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 1.0,
        ),
        itemCount: models.length,
        itemBuilder: (context, index) {
          return ModelItem(
            model: models[index],
            makeId: makeId,
            makeName: makeName,
          );
        },
      ),
    );
  }
}
