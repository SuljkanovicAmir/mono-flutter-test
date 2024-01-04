import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppBarWidget(
    this.scaffoldKey, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Navigator.pop(context);
                Navigator.pushNamed(context, '/makes', arguments: {});
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
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
