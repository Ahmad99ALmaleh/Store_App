import 'package:flutter/cupertino.dart';
import 'package:store_app/core/models/product.dart';
import 'package:store_app/core/services/api.dart';

class ProductProvider with ChangeNotifier{
  bool isLoading = false;
  List<String>categories=["ALL","men's","jewelery","electronics","women's"];
  List<Product>productList=[];
  Future<void>getAllProducts()async{
    final myList = await Api.instance.getProducts();
    productList = myList!.map((object) => Product.fromJson(object)).toList();
    // productList.forEach((element) {
    //   print(element.category);
    // });

    isLoading = true;

    notifyListeners();
  }

  void searchProduct(String data){
    if(data == ''){
      getAllProducts();
    }
    else{
      productList = productList.where((element) => element.title!.toLowerCase().contains(data)).toList();
      notifyListeners();
    }
  }

  void updateByCategory(String cat){
    if(cat== "ALL"){
      getAllProducts();
    }else{
      getAllProducts().then((value) => {
      productList = productList.where((element) => element.category!.toLowerCase().contains(cat)).toList(),
      });
      
    }
  }

}