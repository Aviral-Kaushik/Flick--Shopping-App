import 'package:flick/admin_panel/services/firebase_services.dart';
import 'package:flick/models/Address.dart';
import 'package:tuple/tuple.dart';

class AddressRepository {

  late List<Address> addresses;

  final FirebaseServices firebaseServices;

  AddressRepository(this.firebaseServices);

  // void storeAllAddresses() async {
  //   firebaseServices.storeAllAddresses(addresses);
  // }

  Future<List<Address>> loadUserAddresses(String userId) async {
    addresses = await firebaseServices.getAllUserAddresses(userId);
    return addresses;
  }

  Future<Tuple2<bool, String>> deleteAddress(String userid, String addressId) async {
    Tuple2<bool, String> deleteAddressResponse =
        await firebaseServices.deleteAddress(userid, addressId);

    if (deleteAddressResponse.item1) {
      return deleteAddressResponse;
    } else {
      for (Address address in addresses) {
        if (address.addressId == addressId) {
          addresses.remove(address);
        }
      }
      return deleteAddressResponse;
    }

  }

  Future<void> addNewAddress(Address address) async {
    firebaseServices.addNewAddress(address);
  }

  Future<Tuple2<bool, String>> updateAddress(Address address) async {

    Tuple2<bool, String> updateAddressResponse =
    await firebaseServices.updateAddress(address);

    if (updateAddressResponse.item1) {
      return updateAddressResponse;
    }

    addresses[addresses.indexWhere(
        (element) => element.addressId == address.addressId)] = address;

    return updateAddressResponse;

  }

}