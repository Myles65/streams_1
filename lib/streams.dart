import 'package:flutter/material.dart';
import 'add_streams.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'size_config.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Streams extends StatefulWidget {
  @override
  _StreamsState createState() => _StreamsState();
}

class _StreamsState extends State<Streams> {
  Future getPost() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('Post').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: FutureBuilder(
        future: getPost(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading'),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.legth,
                itemBuilder: (_, index) {
                  return
//                    ListTile(
//                    title: Text(snapshot.data.[index].data['name']),
//                    subtitle: Text(snapshot.data.documents[0]['formi']),
//                  );
                      Card(
                          child: Column(
                    children: <Widget>[
                      Text(snapshot.data[index].data['name']),
                      Text(snapshot.data[index].data['formi']),
                      Text(snapshot.data[index].data['description']),
                    ],
                  ));
                });
          }
        },
      ),

//      StreamBuilder(
//        stream: Firestore.instance.collection('Post').snapshots(),
//        builder: (context, snapshot) {
//          if (!snapshot.hasData) return Text('Loading data');
//          return Column(
//            children: <Widget>[
//              Text(snapshot.data.documents[0]['name']),
//              Text(snapshot.data.documents[0]['formi']),
//              Text(snapshot.data.documents[0]['description']),
//            ],
//          );
//        },
//      ),

//      ListView(
//        children: <Widget>[
//          ListTile(
//            title: Text('Cutting Hair'),
//            subtitle: Text('Active'),
//            onTap: () {},
//          ),
//          ListTile(
//            //leading: Icon(Icons.access_time),
//            title: Text('Lawn Company'),
//            subtitle: Text('Passive'),
//            onTap: () {},
//          ),
//        ],
//      ),
    );
  }
}
