import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:provider/provider.dart';
import '../data/proveone.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Comments extends StatefulWidget {
   final postid ; 
   Comments({this.postid}) ; 

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  TextEditingController _addcomment  = new TextEditingController() ; 
  var id = "" ; 
  Future getComments() async {
    var url = "http://10.0.2.2:8080/mobtech/comments.php";
    var data  = {"postid" : widget.postid}  ;
    var response = await http.post(url , body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }
   Future addComment() async {
    var url = "http://10.0.2.2:8080/mobtech/addcomment.php";
    var data = {"comment" : _addcomment.text , "comuser" : id  , "compost" : widget.postid} ; 
    var response = await http.post(url , body: data);
    Navigator.of(context).pushNamed("post") ;      
  }

    getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
    });
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
          body: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border(top: BorderSide(color: Colors.grey))),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.camera_enhance,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {}),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                width: MediaQuery.of(context).size.width - 50,
                                child: Consumer<ProvOne>(
                                    builder: (context, provone, child) {
                                  return TextFormField(
                                    controller: _addcomment,
                                    decoration: InputDecoration(
                                      hintText:
                                          "        اكتب تعليقك هنا ",
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: addComment,
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          borderSide: BorderSide(
                                              style: BorderStyle.none)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          borderSide: BorderSide(
                                              style: BorderStyle.none)),
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                top: 30,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 70,
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: getComments(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (int i = 0 ; i < snapshot.data.length ; i++) CommentsList(comment: snapshot.data[i]['comment'],username: snapshot.data[i]['username'],)
                            ],
                          );
                        }
                        return Center(child: CircularProgressIndicator(),) ; 
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  final username;
  final comment;
  CommentsList({this.comment, this.username});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Container(
          margin: EdgeInsets.only(top: 15), child: Text(username)),
      subtitle: Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey[100],
          child: Text(comment)),
    );
  }
}
