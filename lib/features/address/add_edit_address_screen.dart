import 'package:flick/components/simple_button.dart';
import 'package:flick/components/simple_header.dart';
import 'package:flick/components/simple_text_area.dart';
import 'package:flick/components/simple_text_field.dart';
import 'package:flick/models/Address.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class AddEditAddressScreen extends StatefulWidget {
  const AddEditAddressScreen({super.key,
    required this.address,
    required this.showUiForEditAddressScreen});

  final Address address;
  final bool showUiForEditAddressScreen;

  @override
  State<AddEditAddressScreen> createState() => _AddEditAddressScreenState();
}

class _AddEditAddressScreenState extends State<AddEditAddressScreen> {

  TextEditingController addressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.showUiForEditAddressScreen) {
      addressController.text = widget.address.address;
      contactNumberController.text = widget.address.contactNumber;
      pinCodeController.text = widget.address.pinCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,

        body: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Column(
                children: [

                  const SizedBox(
                    height: appPadding,
                  ),

                  SimpleHeader(title:
                      widget.showUiForEditAddressScreen
                      ? "Edit Address" : "Add Address"),

                  const SizedBox(
                    height: appPadding,
                  ),

                  Divider(
                    color: blackColor,
                  ),

                  const SizedBox(
                    height: appPadding * 2,
                  ),

                  SimpleTextArea(
                      labelText: "Address",
                      controller: addressController,
                      minLines: 5,
                      maxLines: 20,
                      onChanged: (String address) {
                        addressController.text = address;
                      }),

                  const SizedBox(
                    height: appPadding * 2,
                  ),

                  SimpleTextField(
                      labelText: "Pin Code",
                      controller: pinCodeController,
                      onChanged: (String pinCode) {
                        pinCodeController.text = pinCode;
                      },),

                  const SizedBox(
                    height: appPadding * 2,
                  ),

                  SimpleTextField(
                    labelText: "Contact Number",
                    controller: contactNumberController,
                    onChanged: (String contactNumber) {
                      contactNumberController.text = contactNumber;
                    },),

                ],
              ),
              SimpleButton(
                  buttonText: widget.showUiForEditAddressScreen
                      ? "Edit Address"
                      : "Add Address",
                  backgroundColor: Colors.blueAccent,
                  onPressed: () {
                    if (widget.showUiForEditAddressScreen) {
                      // TODO Edit the updated address
                    } else {
                      // TODO Add the new address
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
