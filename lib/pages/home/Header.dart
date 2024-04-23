import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kHeaderBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu,
                  color: kHeaderTextColor,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Latinas Editores Ltda. ',
                  style: TextStyle(
                    color: kHeaderTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: kHeaderTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
