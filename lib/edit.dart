import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_streams.dart';
//import 'package:streams_1/size_config.dart';
import 'streams.dart';
//import 'models/data.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController _streamController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String streams;
  String description;
  String status;
  //String dropdownStr = 'Active';


  Future<void> udpateStreams(String streams , String description,
      String status) async {

    await Firestore.instance.collection("Post").document().updateData({
      'name': _streamController.text,
      'description': _descriptionController.text,
      'formi': status,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text(
            'Edit Stream',
            style: GoogleFonts.bebasNeue(
                //fontSize: SizeConfig.safeBlockHorizontal * 8,
                textStyle: TextStyle(color: Color(0xFF85bb65))),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF85bb65)),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Stream Name'),
              Container(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Form of income'),
              DropdownButton<String>(
                  elevation: 30,
                  value: dropdownStr,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownStr = newValue;
                    });
                  },
                  items: <String>['Active', 'Passive']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              SizedBox(
                height: 10,
              ),
              Text("Description"),
              Container(
                width: 300,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                onPressed: () {
                  udpateStreams(streams, description, status);
                },
                elevation: 0,
                color: Color(0xFF85bb65),
                child: Text(
                  'Edit Stream',
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
                    MaterialPageRoute(builder: (context) => Streams()),
                  );
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
