import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/constants.dart';
//import '../widgets/constants.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User signedInUser; //This will give us email
  String? messageText; //This will give us messages

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
  final messages=  _firestore.collection('messages').get();
  for(var message in messages.docs){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(children: <Widget>[
          Image.asset("images/chat.png", height: 25),
          SizedBox(height: 10),
          Text("MessageMe")
        ]),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)),
        ],
      ),
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.blue, width: 2)))),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        hintText: "اكتب هنا",
                        border: InputBorder.none),
                  )),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': signedInUser.email,
                      });
                    },
                    child: Text("send",
                        style: TextStyle(
                            color: kRegisterColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  )
                ]),
          ])),
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

/*
Stack(
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
                          padding: const EdgeInsets.symmetric(
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
 */
