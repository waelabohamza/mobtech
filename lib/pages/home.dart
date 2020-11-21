import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../compount/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../compount/moblist.dart';
// Providers 
import 'package:provider/provider.dart';
import '../data/proveone.dart';

 


class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

showalert(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("search"),
          content: Container(
            height: 120,
            child: Column(
              children: <Widget>[
                Text("ادخل اسم الجوال الذي تريد البحث عنه"),
                TextField()
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(onPressed: () {}, child: Text("تم")),
            FlatButton(
                onPressed: () {
                  return Navigator.of(context).pop();
                },
                child: Text("الغاء")),
          ],
        );
      });
}


class HomeState extends State<Home> {
  List<dynamic> listsearch = [];
  var country ; 
  Future getData() async {
    var url = "http://10.0.2.2:8080/mobtech/search.php";
    var response = await http.get(url);
    var resonsebody = jsonDecode(response.body);
    for (int i = 0; i < resonsebody.length; i++) {
      listsearch.add(resonsebody[i]['name']);
    }
    print(listsearch);
  }
  
 final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
 
   

  @override
  void initState() {
    _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            print("onMessage: $message");
           Navigator.of(context).pushNamed("categories") ; 
            // _showItemDialog(message);
          },
          // onBackgroundMessage: myBackgroundMessageHandler,
          onLaunch: (Map<String, dynamic> message) async {
            print("onLaunch: $message");
            // _navigateToItemDetail(message);
          },
          onResume: (Map<String, dynamic> message) async {
            print("onResume: $message");
            // _navigateToItemDetail(message);
          },
        );
    getData();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    
 
  
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mobtech"),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 6,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: DataSearch(list: listsearch));
                })
          ],
        ),
        drawer: MyDrawer(), // End Drawer
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Carousel(
                images: [
                  AssetImage('images/slider/1.png'),
                  AssetImage('images/slider/2.png'),
                  AssetImage('images/slider/1.png'),
                ],
                dotSize: 8,
                dotIncreaseSize: 2,
                dotSpacing: 20,
                dotColor: Colors.white,
                dotBgColor: Colors.black.withOpacity(0.5),
                boxFit: BoxFit.cover,
                dotIncreasedColor: Colors.blue,
              ),
            ),
            // End Careousel
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "الاقسام",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ),
            // Start Cat
            Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                        height: 100,
                        width: 100,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/samsung.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                          subtitle: Container(
                              child: Text(
                            "Samsung",
                            textAlign: TextAlign.center,
                          )),
                        )),
                    Container(
                        height: 100,
                        width: 100,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/hua.jpg',
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                          subtitle: Container(
                              child: Text(
                            "Huawei",
                            textAlign: TextAlign.center,
                          )),
                        )),
                    Container(
                        height: 100,
                        width: 100,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/realme.jpg',
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                          subtitle: Container(
                              child: Text(
                            "Realme",
                            textAlign: TextAlign.center,
                          )),
                        )),
                    Container(
                        height: 100,
                        width: 100,
                        child: ListTile(
                          title: Image.asset('images/category/oppo.png',
                              width: 80, height: 80, fit: BoxFit.fill),
                          subtitle: Container(
                              child: Text(
                            "Oppo",
                            textAlign: TextAlign.center,
                          )),
                        )),
                    Container(
                        height: 100,
                        width: 100,
                        child: ListTile(
                          title: Image.asset('images/category/xia.png',
                              width: 80, height: 80, fit: BoxFit.fill),
                          subtitle: Container(
                              child: Text(
                            "Xiaomi",
                            textAlign: TextAlign.center,
                          )),
                        )),
                  ],
                )),
            // End Cat
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "احدث الموبايلات",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ),
            // Start Lateset Products
            Container(
              height: 400,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Consumer<ProvOne>(builder: (context , provone , child){
              return InkWell(
                      child: GridTile(
                        child: Image.asset("images/product/1.jpg"),
                        footer: Container(
                          height: 20,
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            "P30 PROaa  Price : 1200\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        provone.changename() ; 
                        print(provone.name) ; 
                      }) ; 
                  }) , 
                  
                  InkWell(
                      child: GridTile(
                        child: Image.asset("images/product/2.jpg"),
                        footer: Container(
                          height: 20,
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            "S9 plus Price : 1500\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {}),
                  InkWell(
                      child: GridTile(
                        child: Image.asset("images/product/3.jpg"),
                        footer: Container(
                          height: 20,
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            "Mate 30 PRO Price : 1300\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {}),
                  InkWell(
                      child: GridTile(
                        child: Image.asset("images/product/4.jpg"),
                        footer: Container(
                          height: 20,
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            "OnePlus 8 Pro Price : 1100\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {}),
                  InkWell(
                      child: GridTile(
                        child: Image.asset("images/product/1.jpg"),
                        footer: Container(
                          height: 20,
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            "P30 PRO Price : 1400\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {}),
                  InkWell(
                      child: GridTile(
                    child: Image.asset("images/product/1.jpg"),
                    footer: Container(
                      height: 20,
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        "P30 PRO Price : 1250\$",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
                ],
              ),
            )
            // End
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;
  DataSearch({this.list});
      Future getsearchdata() async {
          var url = "http://10.0.2.2:8080/mobtech/searchmob.php" ;
          var data = {"searchmobile" : query} ;
          var response = await http.post(url , body: data ) ;
          var responsebody = jsonDecode(response.body) ;
          return responsebody ;
        }
  @override
  List<Widget> buildActions(BuildContext context) {
    // Action for AppBar
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon Leading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Results search
    return FutureBuilder(
      future: getsearchdata(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(  itemCount: snapshot.data.length,  itemBuilder: (context , i ) {
                return MobList(battery: snapshot.data[i]['battery'],cpu: snapshot.data[i]['cpu'] ,gpu:  snapshot.data[i]['gpu'],memory: snapshot.data[i]['memory'],mob_cat: snapshot.data[i]['mob_cat'],name: snapshot.data[i]['name'],num_core: snapshot.data[i]['num_core'],camera_depth: snapshot.data[i]['camera_depth'] , camera_micro: snapshot.data[i]['camera_micro'] , screen: snapshot.data[i]['screen'] , screen_protect: snapshot.data[i]['screen_protect'],system: snapshot.data[i]['system'],camera_feature: snapshot.data[i]['camera_feature'],camera_main: snapshot.data[i]['camera_main'],camera_self: snapshot.data[i]['camera_self'],camera_self_feature: snapshot.data[i]['camera_self_feature'],camera_self_video:  snapshot.data[i]['camera_self_video'],camera_tele:  snapshot.data[i]['camera_tele'],camera_ultra:  snapshot.data[i]['camera_ultra'],camera_video:  snapshot.data[i]['camera_video'],price_alg:  snapshot.data[i]['price_alg'],price_eg: snapshot.data[i]['price_eg'],price_jo: snapshot.data[i]['price_jo'],price_sa: snapshot.data[i]['price_sa'],price_sy: snapshot.data[i]['price_sy'],price_uae: snapshot.data[i]['price_uae'],screen_res: snapshot.data[i]['screen_res'],ram:snapshot.data[i]['ram'] ,) ; 
            }) ; 
          }
          return Center(child:CircularProgressIndicator()) ; 
      },
    ) ;  
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searchers for something
    var searchlist =
        query.isEmpty ? list : list.where((p) => p.toLowerCase().contains(query)).toList();
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.mobile_screen_share),
            title: Text(searchlist[i]),
            onTap: (){
              query = searchlist[i] ; 
              showResults(context) ; 
            },
          );
        });
  }
}
 