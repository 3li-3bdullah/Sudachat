import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/constants.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final _auth = FirebaseAuth.instance;
  // late User signedInUser;

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  // void getCurrentUser() {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       signedInUser = user;
  //       print(signedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(children: <Widget>[
          Container(
              decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("images/chat.jpg") , fit: BoxFit.cover), shape:BoxShape.circle),
            ),
          // SizedBox(height: 10),
          Expanded(child: Text("MessageMe"))
        ]),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.close)),
        ],
      ),
      body: Stack(
          children: <Widget>[
             //Column(
            //  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: <Widget>[
           // Container(),
           Positioned(
                bottom: 0,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey))),
                      child: Row(children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.camera_alt_outlined,
                                color: Colors.purple),
                            onPressed: () {}),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            width: MediaQuery.of(context).size.width - 70,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "أكتب هنا",
                                filled: true,
                                fillColor: Colors.grey[200],
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.send, color: Colors.green),
                                    onPressed: () {}),
                                contentPadding: EdgeInsets.all(5),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            )),
                      ]),
                    )
                  ]),
                )),
           
         // ])
          ],
          ),
    );
  }
}
/* 
 Container(
                decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.green, width: 2)),
                ),
                child: Row(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (vlaue) {},
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              hintText: "Write your message here...",
                              border: InputBorder.none),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text("send",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kRegisterColor,
                                  fontSize: 18)))
                    ])),
*/