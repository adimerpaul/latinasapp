import 'dart:convert';
import '../globals.dart' as globals;
import 'package:http/http.dart' as http;

class BookService{
  static apiURL(){
    return globals.API_BACK;
  }
  Future books() async {
    var url = apiURL() + 'books';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
    }
  }
  Future carousels() async {
    var url = apiURL() + 'carousels/allActive';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
    }
  }
  Future categories() async {
    var url = apiURL() + 'books';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
    }
  }
  Future bookAll() async {
    var url = apiURL() + 'books/all';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
    }
  }
}