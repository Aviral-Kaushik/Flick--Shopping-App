import 'package:country_picker/country_picker.dart';
import 'package:flick/admin_panel/blocs/users/users_bloc.dart';
import 'package:flick/admin_panel/blocs/users/users_event.dart';
import 'package:flick/admin_panel/blocs/users/users_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/components/border_text_field.dart';
import 'package:flick/components/drop_down_widget.dart';
import 'package:flick/components/simple_button.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/helper/SnackbarHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({
    super.key,
    required this.user
  });

  final User user;

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {

  final UsersBloc usersBloc = locator.get<UsersBloc>();

  final SnackBarHelper snackBarHelper = SnackBarHelper();
  late DialogHelper dialogHelper;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController joiningDateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  late String selectedDevice;

  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);

    initializeWidgets();
  }

  void initializeWidgets() {
    userNameController.text = widget.user.username;
    emailController.text = widget.user.email;
    nameController.text = widget.user.name;
    joiningDateController.text = widget.user.joiningDate;
    countryController.text = widget.user.country;
    selectedDevice = widget.user.device;
  }

  List<DropdownMenuItem<String>> get deviceDropDownItems {
    List<DropdownMenuItem<String>> deviceDropDownItems = [
      const DropdownMenuItem(value: "Android", child: Text("Android")),
      const DropdownMenuItem(value: "iOS", child: Text("iOS")),
    ];
    return deviceDropDownItems;
  }

  void validateUserAndDetailsAndProceed() {
    if (userNameController.text.isEmpty) {
      snackBarHelper.showSnackBar(context, "Invalid Username!");
      return;
    }

    if (emailController.text.isEmpty) {
      snackBarHelper.showSnackBar(context, "Invalid E-mail!");
      return;
    }

    if (nameController.text.isEmpty) {
      snackBarHelper.showSnackBar(context, "Invalid Name");
      return;
    }

    if (joiningDateController.text.isEmpty) {
      snackBarHelper.showSnackBar(context, "Invalid joining date");
      return;
    }

    if (selectedDevice.isEmpty) {
      snackBarHelper.showSnackBar(context, "Invalid Device");
      return;
    }

    if (countryController.text.isEmpty) {
      snackBarHelper.showSnackBar(context, "Invalid User Country!");
      return;
    }

    usersBloc.add(EditUser(getUser()));
  }

  User getUser() {
    return User(
        id: widget.user.id,
        username: userNameController.text,
        password: widget.user.password,
        email: emailController.text,
        name: nameController.text,
        device: selectedDevice,
        isAdmin: widget.user.isAdmin,
        joiningDate: joiningDateController.text,
        profilePhoto: widget.user.profilePhoto,
        country: countryController.text);
  }

  void showJoiningDatePicker() {
    DatePicker.showDatePicker(
        context,
        showTitleActions: true,
        maxTime: DateTime.now(),
        currentTime: DateTime.now(),
        onConfirm: (date) {
          String formattedDate = DateFormat('MM-dd-yyyy').format(date);
          joiningDateController.text = formattedDate;
          setState(() {});
        }
    );
  }

  void showUserCountryPicker() {
    showCountryPicker(
        context: context,
        useSafeArea: true,
        favorite: ["IN", "US"],
        onSelect: (Country country) {
          countryController.text = country.name;
          setState(() {});
        });
  }

  showProgressDialog(String progressMessage) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(progressMessage, () {
      isAnyDialogShowing = false;
    });
  }

  showSuccessAndErrorDialog(String message, bool showUIForErrorDialog, bool finalDialog) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog(
        showUIForErrorDialog ? "Oops!" : "Success",
        message,
        showUIForErrorDialog ? "Dismiss" : "Okay",
        showUIForErrorDialog, () {
      isAnyDialogShowing = false;
      if (finalDialog) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    });
  }

  dismissAllDialog() {
    if (isAnyDialogShowing) {
      Navigator.pop(context);
      isAnyDialogShowing = false;
    }
  }

  Widget textFieldTitleTextWidget(String title) {
    return Text(
      title,
      style: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersBloc>(
      create: (_) => usersBloc,
      child: BlocListener<UsersBloc, UsersState>(
        listener: (context, state) {

          if (state is UsersLoading) {
            dismissAllDialog();
            showProgressDialog(state.progressMessage);
          }

          if (state is UsersError) {
            dismissAllDialog();
            showSuccessAndErrorDialog(state.errorMessage, true, false);
          }

          if (state is UserEditedSuccessfully) {
            dismissAllDialog();
            showSuccessAndErrorDialog("User Updated Successfully!", false, true);
          }

          if (state is UserDeletedSuccessfully) {
            dismissAllDialog();
            showSuccessAndErrorDialog("User Deleted Successfully!", false, true);
          }
        },
        child: Scaffold(
          backgroundColor: whiteColor,

          body: SafeArea(
            child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: appPadding, left: appPadding, right: appPadding),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AdminAppBar(),

                    const SizedBox(
                      height: appPadding * 2,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text("Update User Details",
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                color: blackColor,
                                fontWeight: FontWeight.w800)),

                        GestureDetector(
                          onTap: () {
                            if (isAnyDialogShowing) {
                              return;
                            }

                            dialogHelper.showWarningDialog(
                                "Are you sure want to delete this user?",
                                "Delete",
                                "Cancel",
                                () {
                                  usersBloc.add(DeleteUser(widget.user));
                                },
                                Colors.redAccent,
                                () {
                                  isAnyDialogShowing = false;
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(appPadding / 2),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.redAccent
                            ),

                            child: Icon(
                              Icons.delete_rounded,
                              color: whiteColor,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: appPadding,
                    ),

                    textFieldTitleTextWidget("Username"),

                    const SizedBox(
                      height: appPadding / 1.5,
                    ),

                    BorderTextField(
                        labelText: "Username",
                        controller: userNameController,
                        backgroundColor: whiteColor,
                        onChanged: (String currentText) {
                          userNameController.text = currentText;
                        }),

                    const SizedBox(
                      height: appPadding,
                    ),

                    textFieldTitleTextWidget("E-mail"),

                    const SizedBox(
                      height: appPadding / 1.5,
                    ),

                    BorderTextField(
                        labelText: "E-mail",
                        controller: emailController,
                        backgroundColor: whiteColor,
                        onChanged: (String currentText) {
                          emailController.text = currentText;
                        }),

                    const SizedBox(
                      height: appPadding,
                    ),

                    textFieldTitleTextWidget("Name"),

                    const SizedBox(
                      height: appPadding / 1.5,
                    ),

                    BorderTextField(
                        labelText: "Name",
                        controller: nameController,
                        backgroundColor: whiteColor,
                        onChanged: (String currentText) {
                          nameController.text = currentText;
                        }),

                    const SizedBox(
                      height: appPadding,
                    ),

                    textFieldTitleTextWidget("Device"),

                    const SizedBox(
                      height: appPadding / 1.5,
                    ),

                    DropDownWidget(
                        selectedValue: selectedDevice,
                        dropDownItems: deviceDropDownItems,
                        backgroundColor: whiteColor,
                        onChanged: (String value) {
                          selectedDevice = value;
                        }),

                    const SizedBox(
                      height: appPadding,
                    ),

                    textFieldTitleTextWidget("Joining Date"),

                    const SizedBox(
                      height: appPadding / 1.5,
                    ),

                    BorderTextField(
                        labelText: "Joining Date",
                        controller: joiningDateController,
                        backgroundColor: whiteColor,
                        readOnly: true,
                        onChanged: (String currentText) {
                          joiningDateController.text = currentText;
                        },
                        onTapped: () {
                          showJoiningDatePicker();
                        }),

                    const SizedBox(
                      height: appPadding,
                    ),

                    textFieldTitleTextWidget("Country"),

                    const SizedBox(
                      height: appPadding / 1.5,
                    ),

                    BorderTextField(
                        labelText: "Country",
                        controller: countryController,
                        backgroundColor: whiteColor,
                        readOnly: true,
                        onChanged: (String currentText) {
                          countryController.text = currentText;
                        },
                        onTapped: () {
                          showUserCountryPicker();
                        }),

                    const SizedBox(
                      height: appPadding * 2,
                    ),

                    SimpleButton(
                        buttonText: "Update User",
                        backgroundColor: Colors.black,
                        textColor: whiteColor,
                        onPressed: () {
                          validateUserAndDetailsAndProceed();
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
