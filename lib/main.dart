import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latinasapp/models/Book.dart';
import 'package:latinasapp/pages/Menu.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latinas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: Menu()
    );
  }
}
