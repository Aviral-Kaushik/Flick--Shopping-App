import 'package:flick/features/address/blocs/address_bloc/address_event.dart';
import 'package:flick/features/address/blocs/address_bloc/address_state.dart';
import 'package:flick/repositories/address_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {

  final AddressRepository addressRepository;

  AddressBloc(this.addressRepository) : super(const InitialAddressState()) {
    on<LoadAddresses>((event, emit) {

    });

    on<DeleteAddress>((event, emit) {

    });
  }

}