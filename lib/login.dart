import 'package:flutter/material.dart';
import 'create_profile.dart';
import 'streams.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Streams',
              style: TextStyle(fontSize: 60, color: Color(0xFF006994)),
            ),
            SizedBox(height: 35),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                hintText: 'Email',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF006994))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                hintText: 'Password',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF006994))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Streams()),
                );
              },
              elevation: 0,
              color: Color(0xFF006994),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Create()),
                );
              },
              child: Text(
                "Don't have an account, Sign up",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}