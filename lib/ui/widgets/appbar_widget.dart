import 'package:car_app/ui/screens/login_page.dart';
import 'package:car_app/ui/screens/profile_page.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppBarWidget(
    this.scaffoldKey, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const user = null;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          scrolledUnderElevation: 0.0,
          title: GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text(
                'CarApp',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  shadows: [
                    Shadow(color: Colors.black, offset: Offset(-1.5, 1.5))
                  ],
                ),
              )),
          leadingWidth: 30,
          leading: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(
              Icons.menu,
              shadows: [Shadow(color: Colors.black, offset: Offset(0, 1.2))],
            ),
            color: Colors.white,
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: <Widget>[
            Container(
                width: 30,
                height: 30,
                clipBehavior: Clip.hardEdge,
                decoration: user != null
                    ? BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 51, 22, 131),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                      )
                    : BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(0, 51, 22, 131),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                      ),
                child: user != null
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(user.photoURL ?? ''),
                        ),
                      )
                    : IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(1.2, 0))
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                      )),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
