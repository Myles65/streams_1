import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Streams',style: TextStyle(
                fontSize: 60,
                color:Color(0xFF006994)
              ),),
              SizedBox(height: 35),
              Text('Create Account',
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
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration.collapsed(
                  hintText: 'Confirm Passowrd',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF006994))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                elevation: 0,
                color: Color(0xFF006994),
                child: Text(
                  'Create Account',
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
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text('Already have an account',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
