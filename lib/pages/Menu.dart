import 'package:flutter/material.dart';
import 'package:latinasapp/pages/Profile/Profile.dart';
import 'package:latinasapp/pages/cart/Cart.dart';
import 'package:latinasapp/pages/home/Home.dart';
import 'package:latinasapp/pages/notifications/Notifications.dart';
import 'package:latinasapp/pages/search/Search.dart';

import '../utils/colors.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var index_color = 0;

  List pages = [
    Home(),
    Search(),
    Cart(),
    Profile(),
    Notifications(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kHeaderBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.menu, color: kHeaderTextColor),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
          },
        ),
        title: const Text(
          'Latinas Editores Ltda. ',
          style: TextStyle(
            color: kHeaderTextColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: kHeaderTextColor),
            onPressed: () {
              setState(() {
                index_color = 1;
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
            },
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: pages[index_color],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                index_color = 4;
              });
            },
            child: Icon(
              Icons.shopping_cart,
              color: index_color == 4 ? kTitleTextColorActive : kTitleTextColor,
            ),
            backgroundColor: kButtonColor,
            shape: const CircleBorder(),
            elevation: 2.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 65.0, // Aumenta la altura para acomodar el texto
        color: kButtonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 0;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 0 ? Icons.home : Icons.home_outlined,
                    color: index_color == 0 ? kTitleTextColorActive : kTitleTextColor,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Inicio',
                    style: TextStyle(
                      color: index_color == 0 ? kTitleTextColorActive : kTitleTextColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 1;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 1 ? Icons.search : Icons.search_outlined,
                    color: index_color == 1 ? kTitleTextColorActive : kTitleTextColor,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Buscar',
                    style: TextStyle(
                      color: index_color == 1 ? kTitleTextColorActive : kTitleTextColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 2;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 2 ? Icons.history : Icons.history_outlined,
                    color: index_color == 2 ? kTitleTextColorActive : kTitleTextColor,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Historial',
                    style: TextStyle(
                      color: index_color == 2 ? kTitleTextColorActive : kTitleTextColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 3;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 3 ? Icons.person : Icons.person_outline,
                    color: index_color == 3 ? kTitleTextColorActive : kTitleTextColor,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Perfil',
                    style: TextStyle(
                      color: index_color == 3 ? kTitleTextColorActive : kTitleTextColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
