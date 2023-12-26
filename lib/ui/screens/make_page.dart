import 'package:car_app/ui/widgets/appbar_widget.dart';
import 'package:car_app/ui/widgets/drawer_widget.dart';
import 'package:car_app/ui/widgets/makes_page_widgets/build_carousel_widget.dart';
import 'package:car_app/ui/widgets/makes_page_widgets/car_logos_widget.dart';
import 'package:car_app/ui/widgets/makes_page_widgets/makes_data_widget.dart';
import 'package:car_app/utils/car_data.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        drawer: const DrawerWidget(),
        appBar: AppBarWidget(_scaffoldKey),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const CarouselBuildWidget(),
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
                          itemCount: CarData.carLogos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CarLogoWidget(
                                carLogo: CarData.carLogos[index]);
                          }))
                ])),
            MakesDataWidget(
              isAscending: _isAscending,
              toggleSort: _toggleSort,
            ),
          ],
        )));
  }
}
