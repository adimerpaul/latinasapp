import 'package:flutter/cupertino.dart';
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
  var total = 0.0;
  @override
  void initState() {
    booksGet();
    super.initState();
  }
  booksGet() async {
    var booksBox = await Hive.openBox<Book>('books');
    setState(() {
      books = booksBox.values.toList();
      total = 0.0;
      books.forEach((element) {
        total += element.price * element.quantity;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(books[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold,
                        // fontSize: 14,
                        color: Colors.black,
                      )
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(books[index].price.toString() + ' Bs',
                              style: TextStyle(
                                // fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text('Total: ' + (books[index].price * books[index].quantity).toString() + ' Bs',
                              style: TextStyle(
                                // fontSize: 12,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ],
                      ),
                      Row(
                        //row que están uno a cada lado
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                icon: Icon(Icons.remove),
                                iconSize: 20,
                                color: Colors.grey,
                                onPressed: () async {
                                  var booksBox = await Hive.openBox<Book>('books');
                                  if (books[index].quantity > 1) {
                                    books[index].quantity--;
                                    booksBox.put(books[index].id.toString(), books[index]);
                                    booksGet();
                                  }
                                },
                              ),
                              Text(books[index].quantity.toString(),
                                style: TextStyle(
                                  // fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                icon: Icon(Icons.add),
                                iconSize: 20,
                                color: Colors.grey,
                                onPressed: () async {
                                  var booksBox = await Hive.openBox<Book>('books');
                                  books[index].quantity++;
                                  booksBox.put(books[index].id.toString(), books[index]);
                                  booksGet();
                                },
                              ),
                            ],
                          ),
                          //icono de trash
                          IconButton(
                            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                            icon: Icon(Icons.delete_outline),
                            iconSize: 20,
                            color: Colors.red,
                            onPressed: () async {
                              var booksBox = await Hive.openBox<Book>('books');
                              booksBox.delete(books[index].id.toString());
                              booksGet();
                            },
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
                    // height: 100, // Alto deseado de la imagen
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/checkout');
                },
                child: Row(
                  //center
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //icono
                    Icon(Icons.shopping_cart, color: Colors.white),
                    Text(
                      'Pagar',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '  ' + total.toString() + ' Bs',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
        ]
      ),
    );
  }
}
