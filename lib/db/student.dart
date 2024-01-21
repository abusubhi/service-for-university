import 'package:cloud_firestore/cloud_firestore.dart';

class StudentsServices {
  Future<List<DocumentSnapshot>> getStudents() async =>
      FirebaseFirestore.instance.collection("students").get().then((result) {
        List<DocumentSnapshot> students = [];
        for (DocumentSnapshot teacher in result.docs) {
          students.add(teacher);
        }
        return students;
      });

  Future addStudents(Map<String, dynamic> data) async {
    FirebaseFirestore.instance.collection("students").doc(data['id']).set(data);
  }
}
