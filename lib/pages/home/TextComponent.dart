import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TextComponent extends StatelessWidget {
  String texto;
  TextComponent({
    super.key,
    required this.texto,
  });
  capitalizeText(String text) {
    var textLower = text.toLowerCase();
    return textLower[0].toUpperCase() + textLower.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            capitalizeText(texto),
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
    );
  }
}
