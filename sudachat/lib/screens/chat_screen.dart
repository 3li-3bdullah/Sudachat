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

  // void getMessages() async {
  //   final messages = _firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }
  void messagesStreams() async {
    for (var snapshot in await _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kappbar,
        title: Row(children: <Widget>[
          Image.asset("images/chat.png", height: 25),
          SizedBox(height: 10),
          Text("MessageMe")
        ]),
        //removed <Widget>
        actions: [
          IconButton(
              onPressed: () {
                messagesStreams();
                // _auth.signOut();
                // Navigator.pop(context);
              },
              icon: Icon(Icons.download_outlined)),
        ],
      ),
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  List<Text> messageWidgets = [];
                  if (!snapshot.hasData) {
                    //will add a spinner
                  }
                  final messages = snapshot.data.docs;
                  return Column(
                    children: messageWidgets,
                  );
                }),
            Container(
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: kappbar, width: 2)))),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
