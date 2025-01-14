import 'package:country_picker/country_picker.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/components/border_text_field.dart';
import 'package:flick/components/drop_down_widget.dart';
import 'package:flick/components/simple_button.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
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

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController joiningDateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String selectedDevice = "Android";

  List<DropdownMenuItem<String>> get deviceDropDownItems {
    List<DropdownMenuItem<String>> deviceDropDownItems = [
      const DropdownMenuItem(value: "Android", child: Text("Android")),
      const DropdownMenuItem(value: "iOS", child: Text("iOS")),
    ];
    return deviceDropDownItems;
  }

  void showJoiningDatePicker() {
    DatePicker.showDatePicker(
        context,
        showTitleActions: true,
        maxTime: DateTime.now(),
        currentTime: DateTime.now(),
        onConfirm: (date) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(date);
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
    return Scaffold(
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

                Text("Update User Details",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: blackColor,
                        fontWeight: FontWeight.w800)),

                const SizedBox(
                  height: appPadding,
                ),

                textFieldTitleTextWidget("Username"),

                const SizedBox(
                  height: appPadding / 2,
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
                  height: appPadding / 2,
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
                  height: appPadding / 2,
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
                  height: appPadding / 2,
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
                  height: appPadding / 2,
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
                  height: appPadding / 2,
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
                      // validateAndProcessProductDetails();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
