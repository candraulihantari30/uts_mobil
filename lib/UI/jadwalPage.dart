import 'package:flutter/material.dart';
import 'package:mobile_desa/Models/jadwal.dart';
import 'package:mobile_desa/Services/apiStatic.dart';
import 'package:mobile_desa/UI/detailJadwalPage.dart';
import 'package:mobile_desa/UI/widget/buttomBar.dart';


class JadwalPage extends StatefulWidget {
  const JadwalPage({ Key? key }) : super(key: key);

  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Jadwal Kegiatan"),
      ),
      body: FutureBuilder <List<Jadwal>>(
          future:ApiStatic.getJadwal(),
          builder: (context, snapshot){
            if (snapshot.connectionState==ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<Jadwal> listJadwal=snapshot.data!;
                return Container(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index)=>Column(
                      children: [
                        InkWell(
                          onTap:  (){
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context)=>DetaiJadwalPage(jadwal: listJadwal[index],)
                          ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              border: Border.all(width: 1,color: listJadwal[index].hari=='07.00-09.30'?Colors.green:Colors.orange)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                              Image.network(listJadwal[index].foto, width: 25,),
                              Padding(
                                padding: const EdgeInsets.only(left:5, right:5),
                                child: Column(
                                  children:[
                                    Text(listJadwal[index].rencanakerja),
                                  ],
                                ),
                              )
                              ],
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                );
            }
        },
      ),
            bottomNavigationBar: buildBottomBar(1, context),
    );
  }
}