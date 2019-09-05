import 'package:cloud_firestore/cloud_firestore.dart';

void addExam(String name, double grade, String lesson) async{

  DocumentReference ref = Firestore.instance.collection('Exams').document();

  return ref.setData({
    'name': name,
    'grade': grade,
    'lesson': lesson,
  });

}