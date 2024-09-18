abstract class AddressEvent {

  const AddressEvent();
}

class LoadAddresses extends AddressEvent {
  final String userId;

  const LoadAddresses(this.userId);
}

class DeleteAddress extends AddressEvent {
  final String addressId;

  const DeleteAddress(this.addressId);
}