import 'package:flick/admin_panel/blocs/settings/settings_event.dart';
import 'package:flick/admin_panel/blocs/settings/settings_state.dart';
import 'package:flick/admin_panel/repositories/settings_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final SettingsRepository settingsRepository;

  SettingsBloc(this.settingsRepository) : super(SettingsInitial()) {
    on<FetchAllAdmins>((event, emit) async {
      emit(const SettingsLoading("Please wait! fetching admins data"));

      final admins = await settingsRepository.fetchAllAdmins();

      emit(AdminFetched(admins));
    });

    on<CreateNewAdmin>((event, emit) async {
      emit(const SettingsLoading("Please wait! Sending admin email"));

      final isAdminCreatedSuccessfully = await settingsRepository.createNewAdmin(event.mail);

      if (isAdminCreatedSuccessfully) {
        emit(const NewAdminCreatedSuccessfully());
      } else {
        emit(const SettingsError("Cannot create admin at this moment"));
      }
    });

    on<DeleteAdmin>((event, emit) async {
      emit(const SettingsLoading("Please wait! Deleting admin"));

      Tuple2<bool, String> adminDeletionResponse = await settingsRepository.deleteAdmin(event.user);

      if (adminDeletionResponse.item1) {
        emit(SettingsError(adminDeletionResponse.item2));
      }

      emit(const AdminDeleteSuccessfully());

    });

    on<SearchAdmin>((event, emit) async {
      emit(const SettingsLoading("Searching...."));

      final admins = await settingsRepository.searchAdmin(event.query);

      emit(AdminFetched(admins));
    });
  }
}