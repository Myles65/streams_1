import 'package:flutter/material.dart';
import 'streams.dart';
import 'package:google_fonts/google_fonts.dart';

class AddStreams extends StatefulWidget {
  @override
  _AddStreamsState createState() => _AddStreamsState();
}

String dropdownStr = 'In Development';

class _AddStreamsState extends State<AddStreams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              Text("Date Started"),
              Container(
                width: 300,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration.collapsed(
                    hintText: 'mm/dd/yyyy',
//                  border: OutlineInputBorder(
//                      borderSide: BorderSide(color: Color(0xFF006994))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Status'),
              DropdownButton<String>(
                  value: dropdownStr,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownStr = newValue;
                    });
                  },
                  items: <String>['In Development', 'Developed']
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Streams()),
                  );
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
