import 'package:car_app/domain_models/vehicle_model_model.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ModelItem extends StatelessWidget {
  const ModelItem({
    Key? key,
    required this.model,
    required this.makeId,
    required this.makeName,
  }) : super(key: key);

  final VehicleModelModel model;
  final String makeId;
  final String makeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: {
          'modelId': model.id.toString(),
          'makeId': makeId,
          'modelName': model.name,
          'makeName': makeName,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 28, 28, 28),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              model.name,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
