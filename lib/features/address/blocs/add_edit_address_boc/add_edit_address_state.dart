abstract class AddEditAddressState {

  const AddEditAddressState();
}

class AddEditAddressInitial extends AddEditAddressState {

  const AddEditAddressInitial();
}

class AddEditAddressLoading extends AddEditAddressState {
  final String progressMessage;

  const AddEditAddressLoading(this.progressMessage);
}

class NewAddressAddedSuccessfully extends AddEditAddressState {

  const NewAddressAddedSuccessfully();
}

class AddEditAddressError extends AddEditAddressState {
  final String errorMessage;

  const AddEditAddressError(this.errorMessage);
}

class AddressUpdatedSuccessfully extends AddEditAddressState {

  const AddressUpdatedSuccessfully();
}