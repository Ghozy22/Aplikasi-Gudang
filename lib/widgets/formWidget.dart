import 'package:flutter/material.dart';
import 'package:project/models/data.dart';
import 'package:project/widgets/button.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({ Key? key, required this.onSavedData }) : super(key: key);


  final ValueChanged<barang> onSavedData;



  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

  late TextEditingController controllerSN;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();
  }

  void initData(){
    controllerSN = TextEditingController();
  }


  @override
  Widget build(BuildContext context) => Form(
    key: formkey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children : [
        textfiledid(),
        const SizedBox(
          height: 20,
        ),
        submit(), 
      ]
    ),
  );

  Widget textfiledid() => TextFormField(
    controller: controllerSN,
    decoration: InputDecoration(
      labelText: 'Serial Number',
      border: OutlineInputBorder(

      )
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter SN' : null , 
  );

  Widget submit() => Button(text: 'Save', onClicked: (){
    final form = formkey.currentState!;
    final isValid = form.validate();

    if(isValid){
      final data = barang(sn: controllerSN.text);
      widget.onSavedData(data);
    }
  });

}