class Jadwal{
  Jadwal({
      required this.idkegiatan,
      required this.rencanakerja,
      required this.hari,
      required this.idPelaksana,
      required this.waktu,
      
      required this.foto,
      required this.createdAt,
      required this.updatedAt,
      
      // required this.namaPelaksana,
      // required this.id_pelaksana_kegiatan,
      // required this.nama_pelaksana,
  });
    int idkegiatan;
    String rencanakerja;
    String hari;
    String idPelaksana;
    String waktu;
    
    String foto;
    String createdAt;
    String updatedAt;
    // int idpelaksanakegiatan;
    // String namapelaksana;
    factory Jadwal.fromJson(Map<String, dynamic> json) =>Jadwal(
      idkegiatan: json["id_kegiatan"],
      rencanakerja: json["rencanakerja"].toString(),
      hari: json["hari"].toString(), 
      idPelaksana: json["id_pelaksana"].toString(),
      waktu: json["waktu"].toString(),
      foto: json["foto"].toString(),
      createdAt: json["created_At"].toString(),
      updatedAt: json["updated_At"].toString(),
      // id_pelaksana_kegiatan: json["id_pelaksana_kegiatan"],
      // nama_pelaksana: json["nama_pelasana"].toString(),
    );
}