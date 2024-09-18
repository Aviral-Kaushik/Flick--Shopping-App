import 'package:flick/models/Address.dart';

abstract class AddressState {

  const AddressState();
}

class InitialAddressState extends AddressState {

  const InitialAddressState();
}

class AddressLoadingState extends AddressState {
  final String progressMessage;

  const AddressLoadingState(this.progressMessage);
}

class AddressLoaded extends AddressState {
  final List<Address> addresses;

  const AddressLoaded(this.addresses);
}

class AddressError extends AddressState {
  final String errorMessage;

  const AddressError(this.errorMessage);
}

class AddressDeletedSuccessfully extends AddressState {

  const AddressDeletedSuccessfully();
}