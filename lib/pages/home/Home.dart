import 'package:flutter/material.dart';
import 'package:latinasapp/pages/home/Header.dart';

import '../../utils/colors.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    Header(),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 200,
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Category 1',
                                      style: TextStyle(
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Category 2',
                                      style: TextStyle(
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Category 3',
                                      style: TextStyle(
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Products',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 200,
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Product 1',
                                      style: TextStyle(
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Product 2',
                                      style: TextStyle(
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Product 3',
                                      style: TextStyle(
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
