import 'package:flutter/material.dart';
import 'package:project/api/api_sheets_barang.dart';
import 'package:project/pages/create.dart';
import 'package:project/widgets/splashscreen.dart';


Future main() async {


//  int a = 1;

 // if(a == 1){
  //  runApp(const Splashscreen());
   // a = 2;
   // if(a == 2){
  //    WidgetsFlutterBinding.ensureInitialized();
//
   //   await sheetsBarang.init();
  //    runApp( const MyApp());
   // }
  //}
  //a = 4;
  
  WidgetsFlutterBinding.ensureInitialized();
//
     await sheetsBarang.init();
     runApp( const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  static final String title = 'Inventori Kamu';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Splashscreen(),
    );
  }
}