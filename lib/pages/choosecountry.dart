import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseCountry extends StatefulWidget {
  ChooseCountry({Key key}) : super(key: key);

  @override
  _ChooseCountryState createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  savePref(String country) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("country", country);
    print(preferences.getString("country"));
  }
  getPref()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var country =preferences.getString("country") ; 
    if (country != null) {
      Navigator.of(context).pushNamed('homepage') ; 
    }

  }
  
  @override
  void initState() {
    getPref() ; 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text('اختر البلد الموجود فيها '),
            ),
            body: Container(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("مصر"),
                    onTap: () {
                      savePref("eg") ; 
                    },
                    trailing: Image.asset("images/flags/eg.png" , width: 40 , height: 40,),
                  ),
                  ListTile(
                    title: Text("السعودية"),
                    onTap: () {
                       savePref("sa") ; 
                    },
                    trailing: Image.asset("images/flags/sa.png", width: 40 , height: 40),

                  ),
                  ListTile(
                    title: Text("سوريا"),
                    onTap: () {
                          savePref("sy") ; 
                    },
                    trailing: Image.asset("images/flags/sy.png", width: 40 , height: 40),

                  ),
                   ListTile(
                    title: Text("الجزائر"),
                    onTap: () {
                          savePref("alg") ; 
                    },
                    trailing: Image.asset("images/flags/alg.png", width: 40 , height: 40),

                  ),
                   ListTile(
                    title: Text("الامارات"),
                    onTap: () {
                          savePref("uae") ; 
                    },
                    trailing: Image.asset("images/flags/uae.png", width: 40 , height: 40),

                  ),
                    ListTile(
                    title: Text("الاردن"),
                    onTap: () {
                          savePref("jo") ; 
                    },
                    trailing: Image.asset("images/flags/jo.png", width: 40 , height: 40),

                  ),
                ],
              ),
            ),
          )),
    );
  }
}
 