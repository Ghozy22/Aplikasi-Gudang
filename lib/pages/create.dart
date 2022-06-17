import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:project/api/api_sheets_barang.dart';
import 'package:project/main.dart';
import 'package:project/models/data.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/formWidget.dart';
import 'package:project/widgets/splashscreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:html' as html;



class create extends StatefulWidget {
  const create({ Key? key }) : super(key: key);

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {

  TextEditingController scan = TextEditingController();

  List<barang> datas = [];

  

  @override
  void didUpdateWidget(covariant create oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    setState(() {
      getDatas();
      mounted;
    });
  }

  void initState(){
    super.initState();
    datas.length;
    getDatas();
  }

  Future getDatas() async {
    final datas = await sheetsBarang.getAll();

    setState(() {
      this.datas = datas;
    });

  }



  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 320,
                  child: TextField(
                      controller: scan,
                      decoration: InputDecoration(
                      labelText: 'Inputkan Id',
                      border: OutlineInputBorder(

                      )
                    ),
                  
                  ),
                ),

              SizedBox(
                width: 20,
              ),

              Button(text: "Hapus" , onClicked: (){
              deleteData();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Splashscreen()));
            }),
              ],
            ),
            
            SizedBox(height: 20,),

            FormWidget( 
              
              //data: coba(),

              //data: datas.isEmpty ? null : datas[index],

              onSavedData: (data) async {
              

              final id = await sheetsBarang.getRowCount() + 1;


              final newData = data.copy(id : id);
              final j = await sheetsBarang.insert([newData.toJson()]);

              Navigator.push(context, MaterialPageRoute(builder: (context) => Splashscreen()));

              
            },
            ),
            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(shrinkWrap: true,itemBuilder: (BuildContext context, int index) {
            
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    

                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 226, 222, 222),
                       
                    ),

                    child: ListTile(
                      title: Text("Serial Number : "+datas[index].sn.toString()),
                      subtitle: Text("Id : "+datas[index].id.toString()),
                      trailing: GestureDetector(child: Icon(Icons.delete), onTap: (){
                        hapusList(datas[index].id.toString());
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Splashscreen()));
                      },),
                    ),
                  ),
                );
              },
              itemCount: datas.length,
              ),
            ),
            
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(hoverColor: Color.fromARGB(255, 177, 8, 149),
       backgroundColor: Color.fromARGB(255, 147, 73, 231),
      onPressed: () {
        html.window.open("https://docs.google.com/spreadsheets/d/1_cmMBI7ZrkHNeHyf5SEr6mblGdwHH_ZHwmcorPdXwUQ/edit?pli=1#gid=0", "_blank");
      } , child: Icon(Icons.file_open)),
      
    );
  }
  Future deleteData() async {
    
    sheetsBarang.deleteData(scan.text);
  }


    Future hapusList(String id) async {
    
    sheetsBarang.deleteData(id);
  }

}


