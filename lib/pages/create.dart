import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:project/api/api_sheets_barang.dart';
import 'package:project/main.dart';
import 'package:project/models/data.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/formWidget.dart';


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
      
    });
  }

  void initState(){
    super.initState();

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

            TextField(
                controller: scan,
                decoration: InputDecoration(
                labelText: 'Serial Number Scan',
                border: OutlineInputBorder(

                )
              ) 
            ),
            
            SizedBox(height: 20,),

            FormWidget( 
              
              //data: coba(),

              //data: datas.isEmpty ? null : datas[index],

              onSavedData: (data) async {
              

              final id = await sheetsBarang.getRowCount() + 1;

              final newData = data.copy(id : id);

              await sheetsBarang.insert([newData.toJson()]);

              
            },
            ),
            SizedBox(height: 20,),

            Button(text: "Hapus", onClicked: deleteData),

            SizedBox(height: 20,),

            SingleChildScrollView(
              child: Column(
              children: List.generate(datas.length, (index) {
                return Text(
                  datas[index].sn.toString(),
                  style: const TextStyle(fontSize: 22),
                  
                );
              }),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
  Future deleteData() async {
    sheetsBarang.deleteData(scan.text);
  }

}


