import 'package:flick/admin_panel/blocs/users/users_event.dart';
import 'package:flick/admin_panel/blocs/users/users_state.dart';
import 'package:flick/admin_panel/repositories/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository usersRepository;

  UsersBloc(this.usersRepository) : super(UsersStateInitial()) {
    on<FetchAllUsers>((event, emit) {});

    on<SearchUser>((event, emit) {});

    on<EditUser>((event, emit) {});
  }
}
