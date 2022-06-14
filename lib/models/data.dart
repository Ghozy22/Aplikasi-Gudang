import 'dart:convert';

class dataFields{
  static final String id = 'id';
  static final String sn = 'serial_number';

  static List<String> getFields() => [id, sn];

}


class barang{
  final int? id;
  final String? sn;

  const barang({
    this.id,
    required this.sn,
  });

  barang copy({
    int ? id,
    String ? sn,
  }) => barang(id: id ?? this.id, sn: sn ?? this.sn );


  static barang fromJson(Map<String, dynamic> json)=> barang( id: jsonDecode(json[dataFields.id]), sn: json[dataFields.sn] );

  Map<String, dynamic> toJson() =>{
    dataFields.id : id,
    dataFields.sn : sn,
  };
}
