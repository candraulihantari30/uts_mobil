import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_desa/Models/jadwal.dart';

class ApiStatic{
  static final host= 'http://192.168.43.13/mobile/public';
  static gethost(){
    return host;
  }
  static Future<List<Jadwal>>getJadwal2() async{
    List<Jadwal> jadwal=[];
    for (var i = 0; i < 10; i++) {
      jadwal.add(
        Jadwal(
          idkegiatan: i, 
          rencanakerja: "Pembersihan Lingkunan Kantor Adat"+i.toString(), 
          hari: "Jumat dan Minggu Pertama Setiap Bulan",   
          idPelaksana: "1",
          waktu: "07.30 s.d 90.00 Wita",
          foto: "adkjadd",
          // id_pelaksana_kegiatan: "1", 
          // nama_pelaksana: "njnjn",
          createdAt:"", updatedAt: "", 
        )
      );
    } 
    return jadwal;
  }
  static Future<List<Jadwal>> getJadwal() async{
    // String response='{"current_page":1,"data":[{"id_kegiatan":20,"rencanakerja":"Pembersihan Jeroan Pura Desa Temukus","hari":"Jumat, minggu kedua setiap bulan","id_pelaksana":"7","waktu":"07.30 s.d 09.00 Wita","foto":"uploads\/jadwal_kegiatans\/1633394057pura.jpg","created_at":null,"updated_at":null,"id_pelaksana_kegiatan":7,"nama_pelaksana":"Prajuru dan Pengempon Paiketan Pemangku"},{"id_kegiatan":22,"rencanakerja":"Pembersihan Lingkungan Kantor Adat","hari":"Jumat, minggu pertama setiap bulan","id_pelaksana":"8","waktu":"07.30 s.d 09.30 Wita","foto":"uploads\/jadwal_kegiatans\/1635314504wihara.jpg","created_at":null,"updated_at":null,"id_pelaksana_kegiatan":8,"nama_pelaksana":"Kelian Banjar Adat dan Krama Tempekan"}],"first_page_url":"http:\/\/192.168.43.13\/mobile\/public\/api\/jadwal?page=1","from":1,"last_page":1,"last_page_url":"http:\/\/192.168.43.13\/mobile\/public\/api\/jadwal?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http:\/\/192.168.43.13\/mobile\/public\/api\/jadwal?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http:\/\/192.168.43.13\/mobile\/public\/api\/jadwal","per_page":5,"prev_page_url":null,"to":2,"total":2}';
    try {
      final response = await http.get(Uri.parse("$host/api/jadwal"));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        print(json);
        return parsed.map<Jadwal>((json) => Jadwal.fromJson(json)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      return [];
    }
    }
}
