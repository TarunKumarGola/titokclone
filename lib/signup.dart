import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:titokclone/policy.dart';
import 'package:titokclone/variable.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  registeruser() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((signeduser) {
      usercollection.doc(signeduser.user.uid).set({
        'email': emailcontroller.text,
        'password': passwordcontroller.text,
        'username': usernamecontroller.text,
        'uid': signeduser.user.uid,
        'profilepic':
            'https://www.accountingweb.co.uk/sites/all/modules/custom/sm_pp_user_profile/img/default-user.png'
      });
    });
    Navigator.pop(context);
  }

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
              "Lets go",
              style: mystyle(25, Colors.black, FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Register",
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
                controller: usernamecontroller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
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
              onTap: () => {registeruser()},
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Register",
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
                  "I agree to ",
                  style: mystyle(20),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsOfPolicy()))
                  },
                  child: Text("Terms of Policy",
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
