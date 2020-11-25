import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DetailPage extends StatelessWidget {
  final String name;
  final String formi;
  final String description;

  const DetailPage({Key key, this.name, this.formi, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title:
        // Image.asset('assets/IncomeFlood Logo.png', fit: BoxFit.cover),
        Text('Stream',
            style: GoogleFonts.bebasNeue(
              //fontSize: SizeConfig.safeBlockHorizontal* 8,
                textStyle: TextStyle(color: Color(0xFF85bb65)))),
        iconTheme: IconThemeData(color: Color(0xFF85bb65)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: 200,
        width: 400,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${this.name}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${this.formi} Income',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    '${this.description}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
