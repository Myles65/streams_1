import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'auth_services.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Center(
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
                  Container(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter an email';
                        }
                        return null;

                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                      ),validator: (value){
                      if(value.isEmpty){
                        return 'Please enter an Password';
                      }
                      return null;

                    },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Passoword',
                      ),
                      validator: (value){
                      if(value.isEmpty){
                        return 'Please enter an Password';
                      }if(value!= passwordController.text){
                        return 'Please enter mathing passwords';
                      }
                      return null;

                    },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()){
                        AuthServices.registerUser(emailController.text, passwordController.text);
                      }
                      else{
                        print('Check errors');
                      }
                      //AuthServices.signInUser(email, password);
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Login()),
//                      );
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
        ],
      ),
    );
  }
}
