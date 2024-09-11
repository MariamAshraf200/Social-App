import 'package:fire/Features/User/Presentation/pages/signup.dart';
import 'package:fire/Features/User/Presentation/widgets/Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Color> grediant = [
    Colors.purple.shade300,
    Colors.purple.shade500,
    Colors.purple.shade700,
    Colors.purple.shade900,
  ];
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  ButtonWidget buttonWidget = ButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: grediant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Positioned(
          bottom: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white10,
            radius: 60,
            child: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              size: 120,
            ),
          ),
        ),
        Text(
          'Welcom back ',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        buttonWidget.textFieldButton(
          _emailcontroller,
          'Email',
          Icons.email,
        ),
        buttonWidget.textFieldButton(
          _passwordcontroller,
          'Password',
          Icons.lock,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: TextButton(
            onPressed: () {},
            style: const ButtonStyle(
                elevation: WidgetStatePropertyAll(500),
                backgroundColor: WidgetStatePropertyAll(Colors.white)),
            child: const Text(
              'Login',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        buttonWidget.textButton('Forget Password', () {}),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
              children: [

            Text(
              'You dont have account ?',
              style: TextStyle(fontSize: 20, color: Colors.green.shade200),
            ),
            buttonWidget.textButton('Sign Up', () {
            })
          ]),
        ),
      ])
    ]);
  }
}
