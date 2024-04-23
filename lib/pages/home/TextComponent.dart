import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../globals.dart' as globals;
class TextComponent extends StatelessWidget {
  final categori;
  TextComponent({
    super.key,
    required this.categori,
  });
  capitalizeText(String text) {
    var textLower = text.toLowerCase();
    return textLower[0].toUpperCase() + textLower.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                capitalizeText(categori['name']),
                style: TextStyle(
                  color: kHeaderTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Ver todo',
                style: TextStyle(
                  color: kButtonColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categori['books'].length,
              itemBuilder: (context, index){
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      height: 200,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(globals.API_BACK + 'uploads/' + categori['books'][index]['image']),
                          fit: BoxFit.cover,
                        ),

                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categori['books'][index]['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // const SizedBox(height: 1),
                            // Text(
                            //   categori['books'][index]['author'],
                            //   style: const TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 9,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
