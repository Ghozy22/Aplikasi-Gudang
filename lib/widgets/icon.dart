import 'package:flutter/material.dart';
  
class Icon extends StatefulWidget {
  const Icon({Key? key}) : super(key: key);
  
  @override  
  _State createState() => _State();  
}  
  
class _State extends State<Icon> {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
        appBar: AppBar(  
          title: const Text('CheckBarang'), 
          backgroundColor: Colors.black, 
        ),  
        body: Padding(  
            padding: const EdgeInsets.all(15),  
            child: Column(  
              children: <Widget>[  
                Ink(
                  decoration: const ShapeDecoration(
                  color: Colors.black,
                  shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt_rounded),
                    color: Colors.white70,
                    iconSize: 30.0,
                    onPressed: () {},
                  )
                ),

                RaisedButton(  
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Scan'), 
                      SizedBox(
                        width: 10,
                      ),
                      Icon( 
                        Icons.camera_alt_rounded,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ],  
            )  
        )  
    );  
  }  
}  