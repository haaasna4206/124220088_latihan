import 'package:flutter/material.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _username = "";
  String? _nickname;
  String _password = "";
  bool isClicked = false;

 
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                username: _username,
                nickname: _nickname
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Login"),
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            _nicknameField(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _nicknameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _nickname = value;
          },
          decoration: InputDecoration(
              hintText: 'Masukkan Nama Panggilan',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 90000, color: const Color.fromARGB(255, 219, 219, 219)))),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _username = value;
          },
          decoration: InputDecoration(
              hintText: 'Masukkan Username',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 90000, color: const Color.fromARGB(255, 221, 221, 221)))),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            _password = value;
          },
          decoration: InputDecoration(
              hintText: 'Masukkan Password',
              hintStyle: TextStyle(color: Colors.black26),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 90000, color: const Color.fromARGB(255, 200, 200, 200)))),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: isClicked == true
              ? WidgetStateProperty.all(const Color.fromARGB(255, 194, 0, 35))
              : WidgetStateProperty.all(const Color.fromARGB(255, 255, 186, 194)),
        ),
        onPressed: () {
          if (_username == "Hasna" && _password == "123") {
            _navigateToHome();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Berhasil!'),
              ),
            );

            setState(() {
              isClicked = !isClicked;
              print(isClicked);
            });
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}