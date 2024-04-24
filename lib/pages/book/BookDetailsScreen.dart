import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:latinasapp/models/Book.dart';
import '../../addons/SnackbarHelper.dart';
import '../../globals.dart' as globals;

class BookDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> book;

  BookDetailsScreen({required this.book});

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  final TextEditingController _quantityController = TextEditingController();
  int _selectedQuantity = 1;

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _quantityController.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Libro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(globals.API_BACK + 'uploads/' + widget.book['image']),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book['name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Descripción:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.book['description'] ?? 'No hay descripción disponible.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Autor: ${widget.book['author']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Precio: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${widget.book['price']} Bs.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Seleccione la cantidad:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _quantityController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Ingrese la cantidad',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _selectedQuantity = int.tryParse(value) ?? 1;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                              ),
                              child: Text(
                                'Cancelar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                var bookBox = await Hive.openBox<Book>('book');

                                // int id;
                                // String? name;
                                // String? author;
                                // String? image;
                                // String? description;
                                // double? price;
                                // int? quantity;
                                // double? total;

                                bookBox.put(widget.book['id'], Book(
                                  id: widget.book['id'],
                                  name: widget.book['name'],
                                  author: widget.book['author'],
                                  image: widget.book['image'],
                                  description: widget.book['description'],
                                  price: double.parse(widget.book['price']),
                                  quantity: int.parse(_quantityController.text),
                                  total: double.parse(widget.book['price']) * _selectedQuantity,
                                ));

                                print('Cantidad seleccionada: $_selectedQuantity');
                                showSuccessSnackBar(context, 'Libro agregado al carrito');
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                              ),
                              child: Text(
                                'Agregar al Carrito',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
