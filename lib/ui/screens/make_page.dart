import 'package:car_app/cubit/make_cubit.dart';
import 'package:car_app/domain_models/vehicle_make_model.dart';
import 'package:car_app/ui/widgets/appbar_widget.dart';
import 'package:car_app/ui/widgets/carousel.dart';
import 'package:car_app/ui/widgets/makes_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MakesPage extends StatefulWidget {
  const MakesPage({super.key});

  @override
  State<MakesPage> createState() => _MakesPageState();
}

class _MakesPageState extends State<MakesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isAscending = true;
  void _toggleSort() {
    setState(() {
      _isAscending = !_isAscending;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> carLogos = [
      {'name': 'Audi', 'imgSrc': 'assets/logos/audi.png', 'makeId': '2'},
      {'name': 'BMW', 'imgSrc': 'assets/logos/bmw.png', 'makeId': '3'},
      {
        'name': 'Mercedes',
        'imgSrc': 'assets/logos/mercedes.png',
        'makeId': '37'
      },
      {'name': 'Porsche', 'imgSrc': 'assets/logos/porsche.png', 'makeId': '18'},
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(_scaffoldKey),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              children: <Widget>[
                const CarsCarousel(),
                Positioned.fill(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0),
                            Color.fromRGBO(0, 0, 0, 0.623),
                            Color.fromRGBO(0, 0, 0, 1),
                          ],
                          stops: [0.75, 0.91, 0.96],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
              height: 260,
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  color: const Color.fromARGB(0, 255, 255, 255),
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: const Text(
                    'Popular',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: carLogos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final makeName = carLogos[index]['name'];

                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/models', arguments: {
                            'makeId': carLogos[index]['makeId'],
                            'makeName': makeName
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 206, 206, 206),
                                  Color.fromARGB(255, 147, 147, 147),
                                  Color.fromARGB(255, 91, 91, 91)
                                ],
                                stops: [0.3, 0.6, 1],
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          carLogos[index]['imgSrc'],
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.contain,
                                        ))),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    carLogos[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(180, 255, 255, 255)),
                                  ),
                                ),
                              ],
                            )));
                  },
                ))
              ])),
          BlocBuilder<VehicleMakeCubit, List<VehicleMakeModel>>(
            builder: (context, vehicleMakes) {
              if (vehicleMakes.isEmpty) {
                context.read<VehicleMakeCubit>().fetchVehicleMakes(page: 1);
                return const CircularProgressIndicator();
              } else {
                vehicleMakes.sort((a, b) {
                  if (_isAscending) {
                    return a.name.compareTo(b.name);
                  } else {
                    return b.name.compareTo(a.name);
                  }
                });

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'All',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              _isAscending
                                  ? 'assets/icons/a.svg'
                                  : 'assets/icons/z.svg',
                              width: 28,
                              height: 28,
                            ),
                            onPressed: _toggleSort,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 700,
                      child: MakesListWidget(vehicleMakes),
                    )
                  ],
                );
              }
            },
          )
        ],
      )),
    );
  }
}
