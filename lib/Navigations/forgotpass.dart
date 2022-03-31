import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworld/Navigations/login.dart';
import 'package:helloworld/constants.dart';

class forgotpassclass extends StatefulWidget {
  @override
  _forgotpassclassState createState() => _forgotpassclassState();
}

class _forgotpassclassState extends State<forgotpassclass> {
  String email = " ";
  TextEditingController emailcont = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Forgot password",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Image(
                image: AssetImage('assets/images/circle1.png'),
                height: 148,
                width: 135,
              ),
              Positioned(
                left: 22,
                top: 30,
                child: Image(
                  image: AssetImage('assets/images/circle2.png'),
                  height: 92,
                  width: 91,
                ),
              ),
              Positioned(
                left: 60,
                top: 80,
                child: Image(
                  image: AssetImage('assets/images/bi_send.png'),
                  height: 92,
                  width: 91,
                ),
              ),
              Positioned(
                  left: -5,
                  child: Image(
                    image: AssetImage('assets/images/q1.png'),
                    height: 24,
                    width: 24,
                  )),
              Positioned(
                  right: -1,
                  child: Image(
                    image: AssetImage('assets/images/q2.png'),
                    height: 24,
                    width: 24,
                  )),
              Positioned(
                  bottom: 0,
                  left: -2,
                  child: Image(
                    image: AssetImage('assets/images/q2.png'),
                    height: 24,
                    width: 24,
                  )),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              height: 100,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 20),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                "Enter the email address associated with your account. You will be sent an email address containing a password reset link. Click the link to reset your password.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            width: 336,
            decoration: BoxDecoration(
                color: constantclass.backgroundcolor,
                borderRadius: BorderRadius.circular(15)),
            child: Form(
              key: _formKey,
              child: TextFormField(
                  controller: emailcont,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  onSaved: (String a) {
                    email = a;
                  },
                  // ignore: missing_return
                  validator: (String a) {
                    if (!a.contains("@")) {
                      return "Please enter valid email";
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(width: 5, color: Colors.white)),
                      hintText: "Enter email address",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      fillColor: constantclass.backgroundcolor,
                      filled: true,
                      prefixIcon: Container(
                          alignment: Alignment.center,
                          width: 63,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.email,
                            color: Colors.black,
                          )))),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          RawMaterialButton(
            child: Container(
              alignment: Alignment.center,
              height: 48,
              width: 149,
              decoration: BoxDecoration(
                  color: constantclass.backgroundcolor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Send",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailcont.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginscreen()));
              }
            },
          )
        ],
      )),
    );
  }
}
