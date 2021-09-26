import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 180,
                child: Image.asset("images/chat.png"),
              ),
              SizedBox(height: 50),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                // onChanged: (value) {
                //   email = value;
                // },
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: kSignColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kRegisterColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                // onChanged: (value) {
                //   password = value;
                // },
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: kSignColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kRegisterColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(height: 10),
              MyButton(
                  color: kRegisterColor,
                  title: "Register",
                  onPressed: ()  {
                    // try {
                    //   final newUser =
                    //       await _auth.createUserWithEmailAndPassword(
                    //           email: email, password: password);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ChatScreen();
                      }));
                    // } catch (e) {
                    //   print(e);
                    // }
                  }),
            ]),
      ),
    );
  }
}
