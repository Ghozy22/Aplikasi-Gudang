import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/pages/create.dart';
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
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const create()),
      );
    });
  }

  @override 
  Widget build(BuildContext context){

    return MaterialApp(
      home:  Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
    
              Image.network(
                'https://img.freepik.com/free-vector/online-order-delivery-service-shipment-internet-shop-basket-cardboard-boxes-buyer-with-laptop-delivery-note-monitor-screen-parcel-vector-isolated-concept-metaphor-illustration_335657-2838.jpg?w=2000',
                width: 525.0,
                height: 525.0,
                fit: BoxFit.cover
              ), 
              const Text(
                "Tunggu Sebentar yaa...",
                style: TextStyle(
                  color: Color.fromARGB(255, 77, 74, 74),
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Color.fromARGB(255, 114, 40, 231), child: Icon(Icons.forward) ,onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const create(),));
        }),
      ),
    );
  }
}