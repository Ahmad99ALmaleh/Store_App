import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/utils/constants.dart';
class Api{

  static Api instance=Api();

  Future<List<dynamic>?> getProducts()async{
    try{
      final response = await http.get(Uri.parse(apiLink));
      if(response.statusCode==success){
        final body = jsonDecode(response.body);
        return body;
      }
    }catch(e){
      print(e);
    }
  }

  addNewProduct()async{
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      body: {
        'title': 'test product',
        'price': 13.5,
        'description': 'lorem ipsum set',
        'image': 'https://i.pravatar.cc',
        'category': 'electronic'
      }
    );
  }

}