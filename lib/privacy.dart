import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'size_config.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('About',
            style: GoogleFonts.bebasNeue(
              //fontSize: SizeConfig.safeBlockHorizontal* 8,
                textStyle: TextStyle(color: Color(0xFF85bb65)))),
        iconTheme: IconThemeData(color: Color(0xFF85bb65)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(width:200, height:200, child: Image.asset('assets/IncomeFlood Logo.png')),
          Center(
              child: Text(
                  'Income Flood is a platform that helps you develop and manage income streams.')),
          SizedBox(height: 25,),
          Center(child: Text('For more info email us at incomefloodapp@gmail.com')),
        ],
      ),
//      appBar: AppBar(
//        elevation: 0.0,
//        title: Center(
//          child: Text(
//            'Streams',
//            style: GoogleFonts.bebasNeue(
//                fontSize: SizeConfig.safeBlockHorizontal * 8,
//                textStyle: TextStyle(color: Color(0xFF006994))),
//          ),
//        ),
//        backgroundColor: Colors.white,
//      ),
    );
  }
}
