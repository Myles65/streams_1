import 'package:flutter/material.dart';

//import 'package:streams_1/edit.dart';
import 'add_streams.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:streams_1/models/data.dart';
//import 'size_config.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'edit.dart';

class Streams extends StatefulWidget {
  @override
  _StreamsState createState() => _StreamsState();
}

class _StreamsState extends State<Streams> {
  TextEditingController _streamController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String status;
  String streams;
  String description;




  @override
  Widget build(BuildContext context) {
    status = dropdownStr;
    //Suppose to set the dropdown list to this value
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Image.asset('assets/IncomeFlood2.png',
            height: 125, width: 125, fit: BoxFit.fill),

        // Text('Income Flood',
        //     style: GoogleFonts.bebasNeue(
        //         //fontSize: SizeConfig.safeBlockHorizontal* 8,
        //         textStyle: TextStyle(color: Color(0xFF006994)))),
        iconTheme: IconThemeData(color: Color(0xFF85bb65)),
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
        backgroundColor: Color(0xFF85bb65),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('Post').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Text('Loading..');
            return ListView(
                children: snapshot.data.documents.map((document) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: .25,
                child: ListTile(
                  title: Text(document['name']),
                  subtitle: Text(document['formi'] + ' Income'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                name: document['name'],
                                formi: document['formi'],
                                description: document['description'],
                              )),
                    );
                  },
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                      caption: 'Edit',
                      color: Colors.green,
                      icon: Icons.edit,
                      onTap: () {
                        _streamController.text = document['name'];
                        _descriptionController.text = document['description'];
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text('Stream Name'),
                                            Container(
                                              width: 300,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.text,
                                                textAlign: TextAlign.center,
                                                controller: _streamController,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('Form of income'),
                                            DropdownButton<String>(
                                                value: document['formi'],
                                                //value:dropdownStr,
                                                //It doesn't update the dropdown data to new selection we ran again
                                                //First iteration keeping for protection
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    dropdownStr = newValue;
                                                  });
                                                },
                                                items: <String>[
                                                  'Active',
                                                  'Passive'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
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
                                                controller:
                                                    _descriptionController,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            RaisedButton(
                                              onPressed: () async {
                                                await Firestore.instance
                                                    .collection('Post')
                                                    .document(
                                                        document.documentID)
                                                    .updateData({
                                                  'name': _streamController.text,
                                                  'description': _descriptionController.text,
                                                  'formi': dropdownStr,
                                                });
                                                // snapshot.data.documents[].reference.updateData({ 'name': _streamController.text,
                                                //   'description': _descriptionController.text,
                                                //   'formi': status,});
                                                //MUST FIGURE OUT HOW TO UPDATE DATA
                                              },
                                              elevation: 0,
                                              color: Color(0xFF85bb65),
                                              child: Text(
                                                'Edit Stream',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Streams()),
                                                );
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Edit(),
                        //   ),
                        // );
                        //NAVIGATION TO EDIT PAGE BUT MAY NOT USE IT
                      }),
                  IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () async {
                        await Firestore.instance
                            .collection('Post')
                            .document(document.documentID)
                            .delete();
                        print('Deleted Post');
                      }),
                ],
              );
            }).toList()
                //***sPLIT
                );
          }),
    );
  }
}

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
