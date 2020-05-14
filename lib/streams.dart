import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF006994),
      ),
    );
  }
}
