import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:shared_preferences/shared_preferences.dart';
import '../compount/animateroute.dart';
import './comments.dart';
import "dart:io";
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  File _file;
  var id = "";
  var username = "none";
  var email;

  TextEditingController _addpost = new TextEditingController();
  // Start Upload Image
  Future pickercamera() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile.path);
    });
  }

  // End Upload Image

  Future getPost() async {
    var url = "http://10.0.2.2:8080/mobtech/post.php";
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;
  }

  Future addPost() async {
    if (_file == null) return;
    String base64 = base64Encode(_file.readAsBytesSync());
    String imagename = _file.path.split("/").last;
    var url = "http://10.0.2.2:8080/mobtech/addpost.php";
    var data = {
      "post": _addpost.text,
      "postuser": id,
      "imagename": imagename,
      "image64": base64
    };
    var response = await http.post(url, body: data);
    print(response.body);

    Navigator.of(context).pushNamed("post");
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      username = preferences.getString("username");
      email = preferences.getString("email");
    });
   
  }
  
   
  @override
  void initState() {
    getPref();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
   
    return Container(
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text('المنشورات'),
            ),
            body: ListView(
              children: <Widget>[
                Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      title: TextFormField(
                        controller: _addpost,
                        maxLength: 255,
                        maxLines: 10,
                        minLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 10),
                            hintText: "اضف جوال للبيع",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_enhance),
                      onPressed: pickercamera,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: addPost,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color:
                                              Colors.grey.withOpacity(0.2)))),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  
                                  Text(
                                    "اضف منشور",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                  ),
                                  Icon(Icons.add_box, color: Colors.grey)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
                FutureBuilder(
                  future: getPost(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                       
                        itemBuilder: (BuildContext context, int i) {
                              
                           return PostList(
                            name: snapshot.data[i]['username'],
                            contentpost: snapshot.data[i]['post'],
                            postid: snapshot.data[i]['post_id'],
                            postimage: snapshot.data[i]['post_image'],
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class PostList extends StatelessWidget {
  final postid;
  final name;
  final contentpost;
  final postimage;

  PostList({this.name, this.contentpost, this.postid, this.postimage});
  @override
  Widget build(BuildContext context) {
    // print(postimage) ;
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            ),
            trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            isThreeLine: true,
            subtitle: Column(
              children: <Widget>[
                Text(
                  contentpost,
                  style: TextStyle(fontSize: 16),
                ),
                Image.network("http://10.0.2.2:8080/mobtech/upload/$postimage")
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.grey))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "اعجاب",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.thumb_up,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                  ),
                  onTap: () {},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "تعليق",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.comment,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(SlideBottomRoute(page: Comments(postid: postid)));
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
          )
        ],
      ),
    );
  }
}
