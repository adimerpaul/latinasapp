import 'package:flutter/material.dart';
import 'package:latinasapp/pages/home/Header.dart';
import 'package:latinasapp/pages/home/TextComponent.dart';
import 'package:latinasapp/services/BookServices.dart';

import '../../utils/colors.dart';
import 'Search.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  List categories = [];

  @override
  void initState() {
    categoriesGet();
    super.initState();
  }
  categoriesGet() async {
    var response = await BookService().categories();
    setState(() {
      categories = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // Header(),
                    // TextComponent(texto: 'Categorías',),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return TextComponent(categori: categories[index],);
                      },
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
