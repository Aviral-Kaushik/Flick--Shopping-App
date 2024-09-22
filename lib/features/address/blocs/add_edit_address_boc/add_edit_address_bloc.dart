import 'package:flick/features/address/blocs/add_edit_address_boc/add_edit_address_event.dart';
import 'package:flick/features/address/blocs/add_edit_address_boc/add_edit_address_state.dart';
import 'package:flick/repositories/address_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class AddEditAddressBloc extends Bloc<AddEditAddressEvent, AddEditAddressState> {

  final AddressRepository addressRepository;

  AddEditAddressBloc(this.addressRepository)
      : super(const AddEditAddressInitial()) {
    on<AddNewAddress>((event, emit) async {
      emit(const AddEditAddressLoading("Initiating Address Request!"));

      await addressRepository.addNewAddress(event.address);

      emit(const NewAddressAddedSuccessfully());
    });

    on<UpdateAddress>((event, emit) async {
      emit(const AddEditAddressLoading("Initiating Address Request!"));

      Tuple2<bool, String> updateAddressResponse =
          await addressRepository.updateAddress(event.address);

      if (updateAddressResponse.item1) {
        emit(AddEditAddressError(updateAddressResponse.item2));
        return;
      }

      emit(const AddressUpdatedSuccessfully());
    });
  }
}