import 'package:cloud_firestore/cloud_firestore.dart';



Future<void> sendStreams(String streams , String description,
    String status) async {
  await Firestore.instance.collection("Post").add({
    'name': streams,
    'description': description,
    'formi': status,
  });
}

