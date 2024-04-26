import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../globals.dart' as globals;

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List books = [];
  @override
  void initState() {
    booksGet();
    super.initState();
  }
  booksGet() async {
    var booksBox = await Hive.openBox('book');
    setState(() {
      books = booksBox.values.toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index].name,
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
              )
            ),
            subtitle: Text(books[index].author,
              style: TextStyle(
                fontSize: 11,
                color: Colors.black,
              )
            ),
            leading: Image.network(
              globals.API_BACK +
                  'uploads/thumb_' +
                  books[index].image,
              fit: BoxFit.cover, // Opción para recortar la imagen
              width: 50, // Ancho deseado de la imagen
              height: 100, // Alto deseado de la imagen
            ),
          );
        },
      ),
    );
  }
}
