import 'package:flutter/material.dart';
import 'package:mobtech/pages/mobiledetails.dart';

class MobList extends StatelessWidget {
  var price ; 
  final country ; 
  final name;
  final screen;
  final screen_protect;
  final screen_res;
  final system;
  final cpu;
  final num_core;
  final gpu;
  final memory;
  final ram ; 
  final battery;
  final camera_main;
  final camera_feature;
  final camera_video;
  final camera_ultra;
  final camera_tele;
  final camera_micro;
  final camera_depth;
  final camera_self;
  final camera_self_feature;
  final camera_self_video;
  final price_eg;
  final price_sa;
  final price_uae;
  final price_jo;
  final price_sy;
  final price_alg;
  final mob_cat;

  MobList(
      {
      this.country , 
      this.battery,
      this.cpu,
      this.memory,
      this.ram , 
      this.name,
      this.camera_feature,
      this.camera_main,
      this.camera_self,
      this.camera_self_feature,
      this.camera_self_video,
      this.camera_tele,
      this.camera_ultra,
      this.camera_micro ,
      this.camera_depth , 
      this.camera_video,
      this.gpu,
      this.mob_cat,
      this.num_core,
      this.price_alg,
      this.price_eg,
      this.price_jo,
      this.price_sa,
      this.price_sy,
      this.price_uae,
      this.screen,
      this.screen_protect,
      this.screen_res,
      this.system});
  @override
  Widget build(BuildContext context) {
    if (country == "sa"){
      price = price_sa ; 
    }
    if (country == "eg"){
      price = price_eg ; 
    }
    if (country == "sy"){
      price = price_sy ; 
    }
    if (country == "alg"){
      price = price_alg ; 
    }
    if (country == "jo"){
      price = price_jo ; 
    }
    if (country == "uae"){
      price = price_uae ; 
    }
    return InkWell(
      child: Container(
        height: 220,
        width: 100,
        child: Card(
          child: Row(
            children: <Widget>[
              Expanded(
                flex:2,
                child: Image.asset("images/product/1.jpg"),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    alignment: Alignment.topRight,
                    height: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center),
                        ),
                 
                            Expanded(
                                child: Row(
                              children: <Widget>[
                                Text(
                                  "المعالج : ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                 Directionality(textDirection: TextDirection.ltr, child: Text(
                                  num_core + " الانوية ",
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                              ],
                            )),
                            
                            Expanded(
                                child: Row(
                              children: <Widget>[
                                Text(
                                  "الكاميرا : ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  camera_main,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                              ],
                            )),
                            
                            Expanded(
                                child: Row(
                              children: <Widget>[
                                Text(
                                  "الذاكرة : ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                  Directionality(textDirection: TextDirection.ltr, child: Text(
                                  memory,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                              ],
                            )),
                           
                          
              
                            Expanded(
                                child: Row(
                              children: <Widget>[
                                Text(
                                  "الرام : ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  ram,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                                
                              ],
                            )
                            ),
                            
                        
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              " السعر : ${price}",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 18 , fontWeight: FontWeight.w700),
                            )),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MobileDetails(
              name_d: name,
              cpu_d: cpu,
              num_core_d: num_core,
              battery_d: battery,
              gpu_d: gpu,
              screen_d: screen,
              screen_protect_d: screen_protect,
              screen_res_d: screen_res,
              memory_d: memory,
              ram_d: ram,
              mob_cat_d: mob_cat,
              system_d: system,
              camera_feature_d: camera_feature,
              camera_main_d: camera_main,
              camera_video_d: camera_video,
              camera_tele_d: camera_tele,
              camera_depth_d: camera_depth,
              camera_micro_d: camera_micro,
              camera_ultra_d: camera_ultra,
              camera_self_d: camera_self,
              camera_self_feature_d: camera_self_feature,
              camera_self_video_d: camera_self_video,
              price_alg_d: price_alg,
              price_eg_d: price_eg,
              price_jo_d: price_jo,
              price_sa_d: price_sa,
              price_sy_d: price_sy,
              price_uae_d: price_uae);
        }));
      },
    );
  }
}

//                       return MobileDetails(name , screen , screen_protect , screen_res  , system , cpu  , num_core , gpu , memory , battery , camera_main , camera_feature , camera_video , camera_tele , camera_ultra , camera_depth , camera_micro , camera_self_feature , camera_self_video  , camera_self  ,price_uae , price_eg , price_jo , price_sa , price_sy , price_alg);
