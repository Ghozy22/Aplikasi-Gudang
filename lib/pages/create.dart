import 'package:flutter/material.dart';
import 'package:project/api/api_sheets_barang.dart';
import 'package:project/main.dart';
import 'package:project/models/data.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/formWidget.dart';

class create extends StatelessWidget {
  const create({ Key? key }) : super(key: key);

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
        child: FormWidget( onSavedData: (data) async {
          await sheetsBarang.insert([data.toJson()]);
        } ),
      ),
    );
  }
}