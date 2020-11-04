import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'size_config.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
              'Streams is an app designed to aid in developing and increasing your streams of income. Streams of income should be developed first around ones passion. '
              'Whatever you passion is develop streams around it. '
              'Generating multiple streams of income can have a major impact on your finances.')),
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
