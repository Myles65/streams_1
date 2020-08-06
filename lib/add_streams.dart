import 'package:flutter/material.dart';
import 'streams.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/data.dart';


class AddStreams extends StatefulWidget {
  @override
  _AddStreamsState createState() => _AddStreamsState();
}

String dropdownStr = 'Active';

class _AddStreamsState extends State<AddStreams> {
  TextEditingController _streamController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String streams;
  String description;
  String status;
  final db = Firestore.instance;
final _formKey = GlobalKey<FormState>();

//    try {
//      await db.collection('Post').add({
//        'name': _streamcontroller.text,
//        'formi': dropdownStr,
//        'description': _descriptioncontroller.text,
//      });
//    } catch (e) {
//      print(e);
//    }
//    if (db != null) {
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => Streams()),
//      );
//      print(
//        '$_streamcontroller',
//      );
//    }
//  }

  // _sendStreams() async {
//    await db.collection('Post').add({
//      'name': _streamcontroller.text,
//      'formi': dropdownStr,
//      'description': _descriptioncontroller.text,
//    });
//    if (db != null) {
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => Streams()),
//      );
//      print(
//        '$_streamcontroller',
//      );
//    }
//  }

//  void initState() {
//    _sendStreams();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    String status = dropdownStr;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Stream Name'),
                Container(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    onChanged: (value){
                      streams = value;
                    },
                    controller: _streamController,
//                decoration: InputDecoration.collapsed(
//                  hintText: 'mm/dd/yyyy',
//                  border: OutlineInputBorder(
//                      borderSide: BorderSide(color: Color(0xFF006994))),
//                ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
//              Text("Date Started"),
//              Container(
//                width: 300,
//                child: TextField(
//                  textAlign: TextAlign.center,
//                  decoration: InputDecoration.collapsed(
//                    hintText: 'mm/dd/yyyy',
////                  border: OutlineInputBorder(
////                      borderSide: BorderSide(color: Color(0xFF006994))),
//                  ),
//                ),
//              ),
//              SizedBox(
//                height: 10,
//              ),
                Text('Form of income'),
                DropdownButton<String>(
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
//              Text(
//                  'Active Income - Income received from performing a service and includes '
//                      'wages, tips, salaries, commissions, '
//                      'and income from businesses in which there is material participation.'),
//              Text('Passive Income - Income derived from assets.'),
                SizedBox(
                  height: 10,
                ),
                Text("Description"),
                Container(
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _descriptionController,
                    onChanged:(value){
                      description = value;
                    },

                    decoration: InputDecoration(
//                border: OutlineInputBorder(
//                    borderSide: BorderSide(color: Color(0xFF006994))),
                        ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  onPressed: () {
                    sendStreams(streams, description, status);
//                    if (sendStreams(streams, description, status) != null){
//                      Navigator.pop(context);
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Streams()),
//                      );
//                    }
                  },
                  elevation: 0,
                  color: Color(0xFF006994),
                  child: Text(
                    'Add Stream',
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
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Add Streams',
            style: GoogleFonts.bebasNeue(
                //fontSize: SizeConfig.safeBlockHorizontal* 8,
                textStyle: TextStyle(color: Color(0xFF006994)))),
        iconTheme: IconThemeData(color: Color(0xFF006994)),
        backgroundColor: Colors.white,
      ),
    );
  }
}
