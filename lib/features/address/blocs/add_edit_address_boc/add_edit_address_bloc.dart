import 'package:flick/features/address/blocs/add_edit_address_boc/add_edit_address_event.dart';
import 'package:flick/features/address/blocs/add_edit_address_boc/add_edit_address_state.dart';
import 'package:flick/repositories/address_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditAddressBloc extends Bloc<AddEditAddressEvent, AddEditAddressState> {

  final AddressRepository addressRepository;

  AddEditAddressBloc(this.addressRepository)
      : super(const AddEditAddressInitial()) {
    on<AddNewAddress>((event, emit) {

    });

    on<UpdateAddress>((event, emit) {

    });
  }
}