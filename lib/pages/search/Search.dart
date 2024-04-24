import 'package:flutter/material.dart';

import '../../services/BookServices.dart';
import '../../globals.dart' as globals;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List bookAll = [];
  List bookAllFull = [];
  bool isLoading = true;
  //search conroller
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    bookAllGet();
    super.initState();
  }

  bookAllGet() async {
    var response = await BookService().bookAll();
    setState(() {
      bookAll = response;
      bookAllFull = response;
      isLoading = false; // La carga ha terminado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Buscar titulo o autor',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          bookAll = bookAllFull.where((element) => element['name'].toString().toLowerCase().contains(value.toLowerCase()) || element['author'].toString().toLowerCase().contains(value.toLowerCase())).toList();
                        });
                      },
                    ),
                  ),
                  isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: bookAll.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            bookAll[index]['name'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )
                        ),
                        subtitle: Text(bookAll[index]['author'].toString()),
                        trailing: Text(bookAll[index]['price'].toString()+' Bs.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 12,
                            )
                        ),
                        leading: Image.network(
                          globals.API_BACK +
                              'uploads/thumbnails/thumb_' +
                              bookAll[index]['image'],
                          fit: BoxFit.cover, // Opción para recortar la imagen
                          width: 50, // Ancho deseado de la imagen
                          height: 100, // Alto deseado de la imagen
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
