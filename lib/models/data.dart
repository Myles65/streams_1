import 'package:cloud_firestore/cloud_firestore.dart';




Future<void> sendStreams(String streams , String description,
    String status) async {
  await Firestore.instance.collection("Post").add({
    'name': streams,
    'description': description,
    'formi': status,
  });
}Future<void> updateStreams(String streams , String description,
    String status) async {
  await Firestore.instance.collection("Post").document().updateData({
    'name': streams,
    'description': description,
    'formi': status,
  });
}

// Future<void> udpateStreams(String streams , String description,
//     String status) async {
//   await Firestore.instance.collection("Post").document().updateData({
//     'name': _streamController.text,
//     'description': _descriptionController.text,
//     'formi': status,
//   });
// }

Future getPost() async {
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore.collection('Post').getDocuments();
  return qn.documents;
}
