import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../globals.dart' as globals;
import '../../models/Book.dart';

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
    var booksBox = await Hive.openBox<Book>('books');
    setState(() {
      books = booksBox.values.toList();
      books.forEach((element) {
        print(element.name);
      });
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
                  fontSize: 14,
                  color: Colors.black,
                )
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(books[index].price.toString() + ' Bs',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )
                ),
                Row(
                  children: [
                    Text('Cantidad: ' + books[index].quantity.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ],
                )
              ],
            ),
            leading: Image.network(
              globals.API_BACK +
                  'uploads/thumb_' +
                  books[index].image,
              fit: BoxFit.cover,
              width: 50, // Ancho deseado de la imagen
              height: 100, // Alto deseado de la imagen
            ),
          );
        },
      ),
    );
  }
}
