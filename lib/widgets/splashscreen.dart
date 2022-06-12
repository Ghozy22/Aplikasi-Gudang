import 'dart:async';
import 'package:flutter/material.dart';
import 'input.dart';

class Splashscreen extends StatefulWidget{
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _Splashscreen createState() => _Splashscreen();

}

class _Splashscreen extends State<Splashscreen>{

  @override
  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async{
    var duration = const Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Input()),
      );
    });
  }

  @override 
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Image.network(
              "https://img2.pngdownload.id/20180207/qve/kisspng-warehouse-factory-people-vector-material-warehouse-5a7b0485e86ea9.1612533215180115259521.jpg",
              width: 175.0,
              height: 175.0,
              fit: BoxFit.cover,
            ),  

            const SizedBox(height: 24.0,),

            const Text(
              "CheckBarang",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}