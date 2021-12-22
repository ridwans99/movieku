import 'package:flutter/material.dart';
import 'package:movieapp/components/bottom_navbar.dart';
import 'package:movieapp/screens/splash_screen.dart';

import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieKu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variable for saving data from data json which derive from php code in the file login.php
  String username = "Ridwan";
  String password = "123456";
  String alert = "Siap Login";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        color: Colors.lightBlue,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black87, shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/icons/ikon.png',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Selamat Datang di MovieKu",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  alert,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameInput,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Isi Username Anda";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87)),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 40,
                          ),
                          hintText: "Isi Username Anda",
                          hintStyle: TextStyle(color: Colors.black87),
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.black87),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordInput,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Isi Password Anda";
                          }

                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87)),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 40,
                          ),
                          hintText: "Isi Password Anda",
                          hintStyle: TextStyle(color: Colors.black87),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black87),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        color: Colors.black87,
                        elevation: 5,
                        child: Container(
                          height: 50,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              loginProcess();
                            },
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void loginProcess() {
    if (_formKey.currentState.validate()) {
      if (usernameInput.text == username && passwordInput.text == password) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Bottom_Navbar(username: usernameInput.text)));
      } else {
        setState(() {
          alert = "Username atau Password salah";
        });
      }
    }
  }
}
