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
        backgroundColor: Colors.green[800],
        title: Row(children: <Widget>[
          Image.asset("images/chat.jpg"),
          SizedBox(height: 10),
          Text("MessageMe")
        ]),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                //add here logout function
              },
              icon: Icon(Icons.close)),
        ],
      ),
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Container(),
            Container(
                decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.green[800], width: 2)),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
          ])),
    );
  }
}
