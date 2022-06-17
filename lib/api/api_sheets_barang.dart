import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:project/models/data.dart';

class sheetsBarang{

  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "sheetsapi-351010",
  "private_key_id": "78bbdf4ed846f3ad63bd24d446ca1f8895affe1e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDBqLk1K16q00sw\nv3smkHoqqGWPZEhSK5iB6JiWCCpSaaHo4OzB6ucIQPS8QdeSD60laZTU/iDO+eRG\nPSuARijCLWC/vxeZ435/oT3ldmc5WlCG9JCpIdTUVjvJAaZLdx1QOphRRM8cOz+4\n9avozc7/KOaKYt6SH9zOseX4rF6nlRUPadIPDa383/pa0gO5RQaXElg7N5TNbT9w\nyPob+VC2AyypRH9jZfFVzYMm1Fw8HbggS537s86fX/0p5TH6OYYGTjwS1uLDL8hO\nPIhM1jM79ofizFQn6/Kndprne2O4E34HsWa8mRuGAeFBGGB1XW5ErI1q78cEc3X3\nDcKZpT2fAgMBAAECggEAG2BvaOrL+TjhhO9Xc34yfFv4mirCZotZ2z43GTk88mWT\nHp7IGX8hpfMOJfGQ40nACm1Akv5R7ls5QAy0XO/jdyp/ENxCHokggDPFJ5keF+eC\nlsbKudOEiM1KqlccsR0SUciBcTZZqP4J5hXPdZu9StOiCPzXxgR8bI6NmiKT8aX3\nLfBo23GxjKVj8b2AbPwMz/qSfh7kz423fZ/mGyN4nPLfpzN2VJkJnYVHIhtCD9ft\nZFLbN9AiavaMFx6l8JTvIT83D9NIXiW2JXuWcDU0QtGd/QmIMsg6n64ImpMIh1k2\niZNTKLKbAFTLn6A658j7uIbAMA69iOhRgZNuK4w1gQKBgQDwj1eFpsaai955n2d/\nrkgSp85krAHANQ1rtUNpeuZ9nqH9kMO0O2U6JAjS8xQYZbpvyrKVsdBY4s+kb9z6\n/3KUwxx9ETbOnu+MN+lKyh8HgQ/n/bJfYrbqg7j+kKwoMIhoYAsZRgyyVhLGwu5i\n9zzIzakKUUZJW/mIEgmgUvEw4QKBgQDOFsALRhwEN1JIOKizibHWLvur/f6BD5m2\n8Jw2TLKP4Qhgf9ovt1Znw9euUl/vh6Mm1m3Y5AS9n25+/y72UurC5CZMSXVo5SM2\nkI60yzaFt5tZ/JVTba0QBsOp1+8bjt0ZX2MLdYq0vmQd0MAgh4s6FSWlNmRZSS/w\nKc/hPZe+fwKBgQCRZlKEWfWY3AmwgYTRS8oMXJkHiF/WiTp/a6Q/USWXsBZBaQqh\nGXVp2vXqazouNO6nO2EN0dgYoZ7XyTVMELJ08Cl7/red07r+iZzcs6ZlpsCyfEkg\nFk5xGQTr+Q3VjOAmFkcfE5QBBr16nb/w2XdH9+bAcbeGB62fbSecXAWkgQKBgDe/\nb7OdA3cgf+GJchke5jxJ+UpNKss+rRYPgDIwDR1egiWYcCz4KydmkrFVFx50Um3v\nE0fYZm/k8L7pyIpZY6fUj4eTV29IjH32HKRLVDRXtm5hJQOsZ2QucD9BaizKOITk\niKZQ5XR/DBYEofQqtj6/+a73R63fXlhY9yK2xpWBAoGAGMFOKYjCwBf0PFvLMuUu\nUAtbMGzl37oQ0KkGwN4fJ+4vUVkI3GEYRS7ggyeMNyj89YUm0sVuJZtCaMgZ/5Ha\n+CYbs8+oCMf7Qmdek0G+obCu+fznOB9EFpN4Vz0/l2Ufq+MJ/+3aSkGn1mKUZE5i\nmR7PYp3VYBonSy6thamOnuE=\n-----END PRIVATE KEY-----\n",
  "client_email": "ghseets@sheetsapi-351010.iam.gserviceaccount.com",
  "client_id": "113422571359255871294",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ghseets%40sheetsapi-351010.iam.gserviceaccount.com"
}

''';

  static final _spreadsheetId = '1_cmMBI7ZrkHNeHyf5SEr6mblGdwHH_ZHwmcorPdXwUQ';

  static final _gsheets = GSheets(_credentials);

  static Worksheet? _dataSheet;

  static Future init() async {
    try{
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);

    _dataSheet = await _getWorkSheet(spreadsheet, title: 'Barang');

    final firstRow = dataFields.getFields();
    _dataSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error : $e');
    }

  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet, {required String title,}) async {
    try {
    return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
  
  static Future<int> getRowCount() async {
      if(_dataSheet == null) return 0; 
      
      final lastRow = await _dataSheet!.values.lastRow();

      return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;

  }

  

    static Future <List<barang>> getAll() async {
    
    if(_dataSheet == null) return <barang>[];

    final datas = await _dataSheet!.values.map.allRows();

    return datas == null ? <barang>[] : datas.map(barang.fromJson).toList();
  

  }

  static Future <barang?> getById(int id) async {
    
    if(_dataSheet == null) return null;

    final json = await _dataSheet!.values.map.rowByKey(id, fromColumn: 1);

    return json == null ? null : barang.fromJson(json);
  }


  static Future insert(List<Map<String, dynamic>> rowList) async {
    
    if(_dataSheet == null) return;

    _dataSheet!.values.map.appendRows(rowList);

  }


  static Future<bool> deleteData(String sn) async {
    
    if(_dataSheet == null) return false;

    final index = await _dataSheet!.values.rowIndexOf(sn);
    if(index == -1) return false;

    

    return _dataSheet!.deleteRow(index);

  }

}
