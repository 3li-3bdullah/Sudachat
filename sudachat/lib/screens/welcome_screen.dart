import 'package:flutter/material.dart';
import '../screens/registration_screen.dart';
import '../screens/signin_screen.dart';
import '../widgets/constants.dart';
import '../widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              Column(children: <Widget>[
                Container(child: Image.asset("images/chat.png")),
                Text("حبابك 10",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: kRegisterColor,
                        )),
              ]),
              SizedBox(height: 30),
              MyButton(
                color: kSignColor,
                title: "Sigin in",
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SignInScreen();
                  }));
                },
              ),
              MyButton(
                 // color: Color(0xff1d5bb5) as Color,
                 color : kRegisterColor,

                  title: "Register",
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return RegistrationScreen();
                    // }));
                  }),
            ]),
      ),
    );
  }
}
