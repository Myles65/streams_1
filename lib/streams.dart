import 'package:flutter/material.dart';
import 'add_streams.dart';
import 'package:google_fonts/google_fonts.dart';
import 'size_config.dart';
import 'main.dart';

class Streams extends StatefulWidget {
  @override
  _StreamsState createState() => _StreamsState();
}

class _StreamsState extends State<Streams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.check),
            title: Text('Cutting Hair'),
            subtitle: Text('Developed'),
            trailing: Icon(Icons.menu),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Lawn Company'),
            subtitle: Text('In Development'),
            trailing: Icon(Icons.menu),
            onTap: () {},
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Streams',
            style: GoogleFonts.bebasNeue(
                //fontSize: SizeConfig.safeBlockHorizontal* 8,
                textStyle: TextStyle(color: Color(0xFF006994)))),
        iconTheme: IconThemeData(color: Color(0xFF006994)),
        backgroundColor: Colors.white,
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStreams()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF006994),
      ),
    );
  }
}

