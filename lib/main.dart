import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/view_model/product_view_model.dart';
import 'package:store_app/ui/views/test.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_)=>ProductProvider(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const TestList(),
    );
  }
}
