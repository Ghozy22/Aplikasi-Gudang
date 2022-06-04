import 'package:flutter/material.dart';
  
class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);
  
  @override  
  _State createState() => _State();  
}  
  
class _State extends State<Input> {  
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
                const Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Input 1',  
                      hintText: 'Data', 
                    ),  
                  ),  
                ),  
                const Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Input 2',  
                      hintText: 'Data',  
                    ),  
                  ),  
                ),  
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(  
                      textColor: Colors.white,  
                      color: Colors.black,  
                      child: const Text('Button 1'),  
                      onPressed: (){},  
                    ),

                    RaisedButton(  
                      textColor: Colors.white,  
                      color: Colors.black,  
                      child: const Text('Button 2'),  
                      onPressed: (){},  
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ), 
              ],  
            )  
        )  
    );  
  }  
}  