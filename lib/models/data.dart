class dataFields{
  static final String id = 'id';
  static final String serial_number = 'serial_number';

  static List<String> getFields() => [id, serial_number];

}


class barang{
  final int? id;
  final String? sn;

  const barang({
    this.id,
    required this.sn,
  });

  Map<String, dynamic> toJson() =>{
    dataFields.id : id,
    dataFields.serial_number : sn,
  };
}
