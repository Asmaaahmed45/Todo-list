import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/Tasks.dart';

CollectionReference<Tasks> getTaskCollection() {
  return FirebaseFirestore.instance.collection('Tasks').withConverter<Tasks>(
      fromFirestore: (snapshot, options) => Tasks.fromJson(snapshot.data()!),
      toFirestore: (tasks, options) => tasks.toJson());
}
Future<void>addTaskToFirestore(Tasks tasks) {
  var collection=getTaskCollection();
  var document=collection.doc();
  tasks.id=document.id;
  return document.set(tasks);
}
Stream<QuerySnapshot<Tasks>> getTaskToFirestore(DateTime Date) {
  return getTaskCollection().where('date',isEqualTo:DateUtils.dateOnly(Date).microsecondsSinceEpoch).snapshots();
}
Future<void>deleteTaskFromFirestore(Tasks t){
  return getTaskCollection().doc(t.id).delete();
}
Future<void>updateTaskFromFirestore(Tasks t) {
  return getTaskCollection().doc(t.id).update(t.toJson());
}