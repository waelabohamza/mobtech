import 'package:flutter/material.dart';

class MobileDetails extends StatefulWidget {
  final name_d ; 
  final screen_d ; 
  final screen_protect_d ; 
  final screen_res_d ; 
  final system_d ; 
  final cpu_d ; 
  final num_core_d ; 
  final gpu_d ; 
  final memory_d ; 
  final ram_d ; 
  final battery_d ; 
  final camera_main_d ; 
  final camera_feature_d ; 
  final camera_video_d ; 
  final camera_ultra_d ;
  final camera_tele_d ;
  final camera_micro_d ;
  final camera_depth_d ;
  final camera_self_d ; 
  final camera_self_feature_d ; 
  final camera_self_video_d ;
  final price_eg_d ;
  final price_sa_d ;
  final price_uae_d ; 
  final price_jo_d ; 
  final price_sy_d ; 
  final price_alg_d ; 
  final mob_cat_d ; 

   MobileDetails({this.name_d , this.battery_d , this.cpu_d , this.gpu_d , this.memory_d , this.ram_d , this.mob_cat_d , this.num_core_d , this.screen_protect_d , this.screen_d , this.camera_feature_d , this.camera_main_d , this.camera_self_d , this.camera_self_feature_d , this.camera_self_video_d , this.camera_tele_d , this.camera_ultra_d , this.camera_video_d , this.price_alg_d , this.price_eg_d , this.price_jo_d , this.price_sa_d , this.price_sy_d , this.price_uae_d , this.screen_res_d , this.system_d  , this.camera_depth_d , this.camera_micro_d});


  @override
  _MobileDetailsState createState() => _MobileDetailsState();
}

class _MobileDetailsState extends State<MobileDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('التفاصيل'),
            centerTitle: true,
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: 300,
                child: GridTile(
                  child: Image.asset("images/product/1.jpg"),
                  footer: Container(
                      height: 80,
                      color: Colors.black.withOpacity(0.3),
                      child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            //  mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  widget.name_d,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "${widget.price_eg_d}\$",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ),
              ),
              // End Header Page
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "المواصفات",
                        style: TextStyle(fontSize: 20),
                      )),
                    ],
                  )),
              // Start Column Spesfiaction
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    mySpec(context , "الموديل : " , widget.name_d , Colors.white , Colors.blue)  , 
                    mySpec(context , " الشاشة : " , widget.screen_d , Colors.blue , Colors.white)  , 
                    mySpec(context , " الحمايات : " , widget.screen_protect_d, Colors.white , Colors.blue)  , 
                    mySpec(context , " دقة الشاشة : " , widget.screen_res_d , Colors.blue , Colors.white)  , 
                    mySpec(context , " نظام التشغيل  : " , widget.system_d, Colors.white , Colors.blue)  , 
                    mySpec(context , " المعالج : ", widget.cpu_d , Colors.blue , Colors.white)  , 
                    mySpec(context , " المعالج الرسومي : " , widget.gpu_d, Colors.white , Colors.blue)  , 
                    mySpec(context , "الذاكرة :" , widget.memory_d , Colors.blue , Colors.white)  , 
                    mySpec(context , "  الرام :  " , widget.ram_d , Colors.white , Colors.blue)  , 
                    mySpec(context , "البطارية : ", widget.battery_d , Colors.blue , Colors.white)  , 

                    
                    // Start Camera
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "الكاميرات",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    mySpec(context , " الكاميرا الرئيسية : " , widget.camera_main_d , Colors.green , Colors.white)  , 
                    mySpec(context , " ميزات التصوير : " , widget.camera_feature_d , Colors.white , Colors.green)  , 
                    mySpec(context , " الفيديو : " , widget.camera_video_d , Colors.green , Colors.white)  , 
                    mySpec(context , " (الكاميرا ultrawide ) : " , widget.camera_ultra_d , Colors.white , Colors.green)  , 
                    mySpec(context , " (الكاميرا micro ) : " , widget.camera_micro_d,  Colors.green , Colors.white)  , 
                    mySpec(context , " (الكاميرا depth ) : " , widget.camera_depth_d , Colors.white , Colors.green)  ,
                    mySpec(context , " (الكاميرا telephoto )  : "  , widget.camera_tele_d,  Colors.green , Colors.white)  ,
                    mySpec(context , " (الكاميرا الامامية )  : " , widget.camera_self_d , Colors.white , Colors.green)  ,
                    mySpec(context , " (ميزات التصوير ) :" , widget.camera_self_feature_d  ,  Colors.green , Colors.white)  ,
                    mySpec(context , " (الفيديو) : " , widget.camera_self_video_d  , Colors.white , Colors.blue)  ,
                    // End camera
                   // Start Price
                    
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "الاسعار",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    mySpec(context , "مصر : " , widget.price_eg_d  , Colors.red , Colors.white)  ,
                    mySpec(context , "السعودية : " , widget.price_sa_d , Colors.white , Colors.red)  ,
                    mySpec(context , " الامارت : " , widget.price_uae_d  , Colors.red , Colors.white)  ,
                    mySpec(context , " سوريا : " , widget.price_sy_d ,  Colors.white , Colors.red)  , 
                    mySpec(context , "الاردن : " , widget.price_jo_d  , Colors.red , Colors.white)  ,
                    mySpec(context , " الجزائر: " , widget.price_alg_d  , Colors.white , Colors.red)  , 
                    // End price

                  ],
                ),
              )
              // End Column Specfiction
            ],
          ),
        ));
  }
}



 mySpec(context , String feature ,String details , Color colorbackground , Color colortext){
   return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        color: colorbackground,
                        child: RichText(
                          text: TextSpan(
                              style:
                                  TextStyle(fontSize: 19, color: Colors.black , ),
                              children:  [
                                 
                                TextSpan(text: feature),
                                TextSpan(
                                    text: details,
                                    style: TextStyle(color: colortext)),
                                    
                              ]),
                        )
                        ) ; 
 }