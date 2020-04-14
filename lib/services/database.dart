import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_vsapp/screens/models/newa.dart';
import 'package:first_vsapp/screens/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference newCollection =
      Firestore.instance.collection('newapp');

  Future updateUserData(String sugars, String name, int strength) async {
    return await newCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Newa> _newListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Newa(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  Stream<List<Newa>> get newa {
    return newCollection.snapshots()
    .map(_newListFromSnapshot);
  }

  Stream<UserData> get userData{
    return newCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
}
}
