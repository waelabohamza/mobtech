import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'  ;
import '../compount/moblist.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Samsung extends StatefulWidget {
  @override
  _SamsungState createState() => _SamsungState();
}

class _SamsungState extends State<Samsung> {
  var country_pref ; 

  Future getData() async {
    var url = "http://10.0.2.2:8080/mobtech/index.php" ;
    var data = {"cat" : "1"} ;
    var response = await http.post(url , body: data ) ; 
    var responsebody = jsonDecode(response.body) ; 
    return responsebody ; 
  }

  getPref()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
     country_pref =preferences.getString("country") ;  
    });
  }

  @override
  void initState() {
    getPref() ; 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text("سامسونغ"),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context , i){
                  return MobList( country: country_pref , battery: snapshot.data[i]['battery'],cpu: snapshot.data[i]['cpu'] ,gpu:  snapshot.data[i]['gpu'],memory: snapshot.data[i]['memory'],mob_cat: snapshot.data[i]['mob_cat'],name: snapshot.data[i]['name'],num_core: snapshot.data[i]['num_core'],camera_depth: snapshot.data[i]['camera_depth'] , camera_micro: snapshot.data[i]['camera_micro'] , screen: snapshot.data[i]['screen'] , screen_protect: snapshot.data[i]['screen_protect'],system: snapshot.data[i]['system'],camera_feature: snapshot.data[i]['camera_feature'],camera_main: snapshot.data[i]['camera_main'],camera_self: snapshot.data[i]['camera_self'],camera_self_feature: snapshot.data[i]['camera_self_feature'],camera_self_video:  snapshot.data[i]['camera_self_video'],camera_tele:  snapshot.data[i]['camera_tele'],camera_ultra:  snapshot.data[i]['camera_ultra'],camera_video:  snapshot.data[i]['camera_video'],price_alg:  snapshot.data[i]['price_alg'],price_eg: snapshot.data[i]['price_eg'],price_jo: snapshot.data[i]['price_jo'],price_sa: snapshot.data[i]['price_sa'],price_sy: snapshot.data[i]['price_sy'],price_uae: snapshot.data[i]['price_uae'],screen_res: snapshot.data[i]['screen_res'],ram:snapshot.data[i]['ram'] ,) ; 
                },
              );
              }
              return Center(child:CircularProgressIndicator()) ; 
            },
          ),
        ));
  }
}
