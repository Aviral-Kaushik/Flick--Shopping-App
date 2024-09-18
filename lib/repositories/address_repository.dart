import 'package:flick/admin_panel/services/firebase_services.dart';
import 'package:flick/models/Address.dart';
import 'package:tuple/tuple.dart';

class AddressRepository {

  late List<Address> address;

  final FirebaseServices firebaseServices;

  AddressRepository(this.firebaseServices);

  Future<List<Address>> loadUserAddresses(String userId) async {
    return address;
  }

  Future<Tuple2<bool, String>> deleteAddress(String userid) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<void> addNewAddress(Address address) async {

  }

  Future<Tuple2<bool, String>> updateAddress(Address address) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    return Tuple2(hasErrorOccurred, errorMessage);
  }

}