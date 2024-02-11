import 'package:boilerplate/models/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationListService {
  Future<List<LocationModel?>> getLocationList() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('locations').get();

    //Add Error Handling

    List<LocationModel> list = querySnapshot.docs.map((doc) => LocationModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    return list;
  }
}
