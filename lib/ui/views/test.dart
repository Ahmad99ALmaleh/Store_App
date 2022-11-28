import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/view_model/product_view_model.dart';

class TestList extends StatefulWidget {
  const TestList({Key? key}) : super(key: key);

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {

  @override
  void initState() {

    super.initState();
    context.read<ProductProvider>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final obj = context.watch<ProductProvider>();
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: obj.isLoading==false
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (val){
                    obj.searchProduct(val);
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(0.5),
                    filled: true,
                    hintText: "search for item",
                  ),
                ),
              ),
              SizedBox(
                height: _height*0.10,
                width: _width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: obj.categories.length,
                    itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        context.read<ProductProvider>().updateByCategory(obj.categories[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(10.0),
                        color: Colors.blue.withOpacity(0.5),
                        width: 100,
                        height: 80,
                        child: Text(
                            obj.categories[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                    }
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: obj.productList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.network(
                              obj.productList[index].image.toString(),
                            width: _width*0.75,
                            height: _height*0.3,
                          ),
                          ListTile(
                            title: Text(
                              "${obj.productList[index].title}",
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),

      );

  }
}
