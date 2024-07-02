import 'package:flick/admin_panel/blocs/users/users_event.dart';
import 'package:flick/admin_panel/blocs/users/users_state.dart';
import 'package:flick/admin_panel/repositories/users_repository.dart';
import 'package:flick/models/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository usersRepository;

  UsersBloc(this.usersRepository) : super(UsersStateInitial()) {
    on<FetchAllUsers>((event, emit) async {
      emit(const UsersLoading("Please wait! Fetching users data"));

      Tuple3<List<User>, bool, String> usersResponse =
          await usersRepository.fetchAllUsers();

      if (usersResponse.item2) {
        emit(UsersError("Cannot Load User: ${usersResponse.item3}"));
      } else {
        emit(FetchedAllUsers(usersResponse.item1));
      }

    });

    on<SearchUser>((event, emit) async {
      // emit(const UsersLoading("Searching ..."));

      List<User> users = await usersRepository.searchUsers(event.searchQuery);

      emit(FetchedAllUsers(users));
    });

    on<EditUser>((event, emit) async {
      emit(const UsersLoading("Updating User! Please wait"));

      Tuple2<bool, String> userUpdateResponse =
          await usersRepository.editUser(event.userToBeEdited);

      if (userUpdateResponse.item1) {
        emit(const UserEditedSuccessfully());
      } else {
        emit(const UsersError("Cannot Update User at this moment"));
      }

    });

    on<ApplyFilter>((event, emit) async {
      emit(const UsersLoading("Applying filter! Please Wait"));

      Tuple3<List<User>, bool, String> usersResponse =
          await usersRepository.applyUserFilter(event.userFilter);

      if (usersResponse.item2) {
        emit(UsersError("Error: ${usersResponse.item3}"));
      } else {
        emit(FetchedAllUsers(usersResponse.item1));
      }

    });

    on<DeleteUser>((event, emit) async {
      emit(const UsersLoading("Please Wait! Deleting User"));

      Tuple2<bool, String> deletedResponse =
          await usersRepository.deleteUser(event.user);

      if (deletedResponse.item1) {
        emit(const UserDeletedSuccessfully());
      } else {
        emit(UsersError(
            "Cannot Delete User at this moment ${deletedResponse.item2}"));
      }

    });
  }
}
