import 'package:boilerplate/models/bin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BinListService {
  Future<List<BinModel?>> getBinList() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('bins').get();

    //Add Error Handling

    List<BinModel> binsList = querySnapshot.docs.map((doc) => BinModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    return binsList;
  }
}
