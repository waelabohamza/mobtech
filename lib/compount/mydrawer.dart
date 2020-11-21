import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  var email;
  bool isSignIn = false;
  getPref() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      username = preferences.getString("username");
      email = preferences.getString("email");

      if (username != null) {
        setState(() {
          username = preferences.getString("username");
          email = preferences.getString("email");
          isSignIn = true;
        });
      }
    }
  @override
  void initState() {
     getPref() ; 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  

    

    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: isSignIn ? Text(email) : Text("")  ,
          accountName:  isSignIn ? Text(username) :Text("") ,
          currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage("images/drawer.jpg"), fit: BoxFit.cover)),
        ),
        ListTile(
          title: Text(
            "الصفحة الرئيسية",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: Icon(
            Icons.home,
            color: Colors.blue,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('homepage');
          },
        ),
        ListTile(
          title: Text(" الاقسام ",
              style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: Icon(
            Icons.category,
            color: Colors.blue,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('categories');
          },
        ),
                  isSignIn ?  ListTile(
          title: Text("اضافة منشور",
              style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: Icon(
            Icons.add_box,
            color: Colors.blue,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed("post");
          },
        ) : SizedBox(height: 0,) , 
        // ExpansionTile(
        //   leading: Icon(
        //     Icons.category,
        //     color: Colors.blue,
        //     size: 25,
        //   ),
        //   title: Text("انواع الجوالات" ,  style: TextStyle(color: Colors.black, fontSize: 18)),
        //   children: <Widget>[
        //      Container( padding: EdgeInsets.all(10) , color:Colors.red , width: 400 , child: Text("Wael"),)
        //   ],
        // ),
        Divider(color: Colors.blue),
        ListTile(
          title: Text(" حول التطبيق  ",
              style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: Icon(
            Icons.info,
            color: Colors.blue,
            size: 25,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text("الاعدادات",
              style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: Icon(
            Icons.settings,
            color: Colors.blue,
            size: 25,
          ),
          onTap: () {},
        ),


      isSignIn ?  ListTile(
          title: Text("تسجيل الخروج",
              style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.blue,
            size: 25,
          ),
          onTap: () async {
                 SharedPreferences preferences = await SharedPreferences.getInstance();
                 preferences.remove("username") ; 
                 preferences.remove("email") ; 
                 Navigator.of(context).pushNamed("login") ; 
          },
        ):   ListTile(
          title: Text("تسجيل الدخول",
              style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.blue,
            size: 25,
          ),
          onTap: () {
            Navigator.of(context).pushNamed("login");
          },
        ),
      ],
    ));
  }
}

// class MyDrawer extends StatelessWidget {
//   var username   ;
//   var email ;
//   @override
//   Widget build(BuildContext context) {

//   }
// }
/*
 import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(height: double.infinity, width: double.infinity),
            buildPositionedtop(mdw),
            buildPositionedBottom(mdw),
      Container(
        height: 1000,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        "تسجيل الدخول ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
            buildContaineraAvatar(mdw),
              Container(
                height: 250,
                width: mdw / 1.2,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: .1,
                      blurRadius: 1,
                      offset: Offset(1, 1))
                ]),
                child: Form(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Start Text Username 
                      Text("اسم المستخدم"),
                      SizedBox(height: 10,)  , 
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(4),
                          hintText: "ادخل اسم المستخدم هنا "  , 
                          filled: true , 
                          fillColor: Colors.grey[200] , 
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color : Colors.grey[500] , style:BorderStyle.solid , width: 1  )
                          ) , 
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color : Colors.blue , style:BorderStyle.solid , width: 1  )
                          )
                        ),
                      ) ,
                      // End Text username 
                      SizedBox(height: 10,)  , 
                      // Start Text password 
                      Text("كلمة المرور"),
                      SizedBox(height: 10,)  , 
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(4),
                          hintText: "ادخل اسم كلمة المرور هنا "  , 
                          filled: true , 
                          fillColor: Colors.grey[200] , 
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color : Colors.grey[500] , style:BorderStyle.solid , width: 1  )
                          ) , 
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color : Colors.blue , style:BorderStyle.solid , width: 1  )
                          )
                        ),
                      ) 
                      // End Text username 
                    ],
                  ),
                )),
              ),
              ],
          ),
        ))
            
          ],
        ),
      ),
    );
  }

  Container buildContaineraAvatar(double mdw) {
    return 
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
                    ]),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 25,
                        right: 25,
                        child: Icon(Icons.person_outline,
                            size: 50, color: Colors.white)),
                    Positioned(
                        top: 35,
                        left: 60,
                        child: Icon(Icons.arrow_back,
                            size: 30, color: Colors.white))
                  ],
                ),
              ) ; 
            
  }

  Positioned buildPositionedtop(double mdw) {
    return Positioned(
        child: Transform.scale(
      scale: 1.3,
      child: Transform.translate(
        offset: Offset(0, -mdw / 1.7),
        child: Container(
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color: Colors.grey[800])),
      ),
    ));
  }

  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
        top: 300,
        right: mdw / 1.5,
        child: Container(
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color: Colors.blue[800].withOpacity(0.5))));
  }
}

/*
         Positioned buildPositionedbottom(double mdw) {
    return Positioned(
        top: 300,
        right: mdw / 2,
        child: Container(
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
              color: Colors.blue[800].withOpacity(0.4),
              borderRadius: BorderRadius.circular(mdw)),
        ));
  }

  Positioned buildPositionedtop(double mdw) {
    return Positioned(
        child: Transform.translate(
      offset: Offset(0, -mdw / 1.2),
      child: Transform.scale(
        scale: 1.3,
        child: Container(
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(mdw)),
        ),
      ),
    ));
  }
*/

*/
