import 'package:boilerplate/models/bin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BinListService {
  Future<List<BinModel?>> getBinList(location) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('bins').get();

    //Add Error Handling

    List<BinModel> binsList = querySnapshot.docs.map((doc) => BinModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    List<BinModel> _list = binsList.where((element) => element.location.toString().trim().toLowerCase() == location.toString().trim().toLowerCase()).toList();
    return _list;
  }
}
