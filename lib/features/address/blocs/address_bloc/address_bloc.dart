import 'package:flick/features/address/blocs/address_bloc/address_event.dart';
import 'package:flick/features/address/blocs/address_bloc/address_state.dart';
import 'package:flick/models/Address.dart';
import 'package:flick/repositories/address_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {

  final AddressRepository addressRepository;

  AddressBloc(this.addressRepository) : super(const InitialAddressState()) {
    on<LoadAddresses>((event, emit) async {
      emit(const AddressLoadingState("Please wait! Fetching Your Addresses"));

      List<Address> addresses =
          await addressRepository.loadUserAddresses(event.userId);

      emit(AddressLoaded(addresses));
    });

    on<DeleteAddress>((event, emit) {
      emit(const AddressLoadingState("Please wait! Deleting Address..."));

    });
  }

}