import 'package:car_app/cubit/favorites/favorites_cubit.dart';
import 'package:car_app/ui/screens/favorites_page.dart';
import 'package:car_app/ui/screens/vin_decoder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> carLogos = [
      {'name': 'Audi', 'imgSrc': 'assets/logos/audi.png', 'makeId': '2'},
      {'name': 'BMW', 'imgSrc': 'assets/logos/bmw.png', 'makeId': '3'},
      {
        'name': 'Mercedes',
        'imgSrc': 'assets/logos/mercedes.png',
        'makeId': '37'
      },
      {'name': 'Porsche', 'imgSrc': 'assets/logos/porsche.png', 'makeId': '18'},
    ];
    return Drawer(
      backgroundColor: const Color.fromARGB(220, 0, 0, 0),
      elevation: 0,
      width: MediaQuery.of(context).size.width / 1.4,
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: Text(
                'CarApp',
                style: TextStyle(
                    fontSize: 35.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    height: 1),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/makes', arguments: {});
            },
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: const Icon(Icons.favorite_outline),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return BlocProvider(
                      create: (context) => FavoritesCubit(),
                      child: MyFavoritesPage(),
                    );
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
          ExpansionTile(
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
            title: const Text(
              "Popular",
              style: TextStyle(color: Colors.white),
            ),
            leading: const Icon(
              Icons.star_outline,
            ),
            childrenPadding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            textColor: Colors.white,
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carLogos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Image.asset(
                            carLogos[index]['imgSrc'],
                            height: 28,
                            width: 28,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            carLogos[index]['name'],
                            style: const TextStyle(
                                color: Color.fromARGB(200, 255, 255, 255)),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/models', arguments: {
                          'makeId': carLogos[index]['makeId'],
                          'makeName': carLogos[index]['name']
                        });
                      },
                    );
                  })
            ],
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.code),
            title: const Text('Vin Decoder'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const VinDecoderPage();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
