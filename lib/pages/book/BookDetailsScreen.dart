import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class BookDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> book;

  BookDetailsScreen({required this.book});

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
              height: 300, // Altura de la imagen de fondo
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(globals.API_BACK + 'uploads/' + book['image']),
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
                    book['name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Color del nombre en azul
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
                    book['description'] ?? 'No hay descripción disponible.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Autor: ${book['author']}',
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
                    '${book['price']} Bs.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Color del precio en rojo
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity, // Ocupa todo el ancho disponible
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción al hacer clic en el botón (Agregar al carrito)
                        // Puedes implementar esta lógica según tu necesidad
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent, // Color del botón en azul
                      ),
                      child: Text(
                        'Agregar al Carrito',
                        style: TextStyle(
                          color: Colors.white, // Color del texto en blanco
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
    );
  }
}
