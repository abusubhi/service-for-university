import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CollageServices {
  Future<List<DocumentSnapshot>> getCollages() async =>
      FirebaseFirestore.instance.collection("collages").get().then((result) {
        List<DocumentSnapshot> categories = [];
        for (DocumentSnapshot category in result.docs) {
          categories.add(category);
        }
        return categories;
      });

  Future addCollage(Map<String, dynamic> data) async {
    String catId = const Uuid().v1();
    data['id'] = catId;
    FirebaseFirestore.instance.collection("collages").doc(catId).set(data);
  }
}
