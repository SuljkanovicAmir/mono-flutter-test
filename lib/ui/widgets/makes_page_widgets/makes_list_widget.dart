import 'package:car_app/domain_models/vehicle_make_model.dart';
import 'package:flutter/material.dart';

class MakesListWidget extends StatefulWidget {
  const MakesListWidget(this.vehicleMakes, this.showSearch, this.isAscending,
      {super.key});
  final List<VehicleMakeModel> vehicleMakes;
  final bool showSearch;
  final bool isAscending;
  @override
  State<MakesListWidget> createState() => _MakesListWidgetState();
}

class _MakesListWidgetState extends State<MakesListWidget> {
  int _currentPage = 0;
  final int _itemsPerPage = 10;
  late TextEditingController controller;
  late List<VehicleMakeModel> filteredMakes;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    filteredMakes = List.from(widget.vehicleMakes);
  }

  List<dynamic> get _currentDisplayedMakes {
    final startIndex = _currentPage * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    return filteredMakes.sublist(
      startIndex,
      endIndex.clamp(0, filteredMakes.length),
    );
  }

  void filterMakes(String query) {
    setState(() {
      filteredMakes = widget.vehicleMakes.where((make) {
        final makeNameLower = make.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return makeNameLower.contains(queryLower);
      }).toList();
      _currentPage = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    filteredMakes.sort((a, b) {
      if (widget.isAscending) {
        return a.name.compareTo(b.name);
      } else {
        return b.name.compareTo(a.name);
      }
    });

    return Column(children: [
      if (widget.showSearch)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextField(
            controller: controller,
            onChanged: filterMakes,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              helperStyle: TextStyle(color: Color.fromARGB(255, 218, 218, 218)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 134, 134, 134),
                fontSize: 16,
              ),
              labelText: 'Search makes',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        itemCount: _currentDisplayedMakes.length,
        itemBuilder: (context, index) {
          final makeId = _currentDisplayedMakes[index].id.toString();
          final makeName = _currentDisplayedMakes[index].name;

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/models', arguments: {
                'makeId': makeId,
                'makeName': makeName,
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              child: ListTile(
                title: Text(
                  makeName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                trailing: Image.asset(
                  'assets/logos/template.png',
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _currentPage > 0
                ? () {
                    setState(() {
                      _currentPage--;
                    });
                  }
                : null,
            child: const Text(
              'Previous',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: _currentDisplayedMakes.length == _itemsPerPage
                ? () {
                    setState(() {
                      _currentPage++;
                    });
                  }
                : null,
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    ]);
  }
}
