import 'package:flick/models/Address.dart';

abstract class AddEditAddressEvent {

  const AddEditAddressEvent();
}

class AddNewAddress extends AddEditAddressEvent {
  final Address address;

  const AddNewAddress(this.address);
}

class UpdateAddress extends AddEditAddressEvent {
  final Address address;

  const UpdateAddress(this.address);
}