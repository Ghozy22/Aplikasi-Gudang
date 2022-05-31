import 'package:flutter/material.dart';
import 'package:project/api/api_sheets_barang.dart';
import 'package:project/pages/create.dart';


Future main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await sheetsBarang.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  static final String title = 'Gudang';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: create(),
    );
  }
}