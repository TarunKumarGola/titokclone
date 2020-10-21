import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:titokclone/home.dart';
import 'package:titokclone/signup.dart';
import 'package:titokclone/variable.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        setState(() {
          isSigned = true;
        });
      } else {
        setState(() {
          isSigned = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: isSigned == false ? Login() : HomePage());
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to TikTok",
              style: mystyle(25, Colors.black, FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Login",
              style: mystyle(25, Colors.black, FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  labelStyle: mystyle(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  labelStyle: mystyle(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                try {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailcontroller.text,
                      password: passwordcontroller.text);
                } catch (e) {
                  SnackBar snackBar = SnackBar(
                      content: Text("Try again email or password is wrong"));
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: mystyle(20, Colors.white, FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account?",
                  style: mystyle(20),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()))
                  },
                  child: Text("Register",
                      style: mystyle(
                        20,
                        Colors.purple,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
