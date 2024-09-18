import 'package:flick/components/simple_button.dart';
import 'package:flick/components/simple_header.dart';
import 'package:flick/components/simple_text_area.dart';
import 'package:flick/components/simple_text_field.dart';
import 'package:flick/features/address/blocs/add_edit_address_boc/add_edit_address_bloc.dart';
import 'package:flick/features/address/blocs/add_edit_address_boc/add_edit_address_event.dart';
import 'package:flick/features/address/blocs/add_edit_address_boc/add_edit_address_state.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Address.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final AddEditAddressBloc addEditAddressBloc = locator.get<AddEditAddressBloc>();

  TextEditingController addressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  late DialogHelper dialogHelper;

  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    if (widget.showUiForEditAddressScreen) {
      addressController.text = widget.address.address;
      contactNumberController.text = widget.address.contactNumber;
      pinCodeController.text = widget.address.pinCode;
    }

    dialogHelper = DialogHelper(context);
  }

  showProgressDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  showSuccessfulDialog(String successfulMessage) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog(
        "Success!", successfulMessage, "Okay", false, () {
      isAnyDialogShowing = false;
    });
  }

  showErrorDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog("Oops!", message, "Dismiss", true,
            () {
          isAnyDialogShowing = false;
        });
  }

  dismissAllDialogs() {
    if (isAnyDialogShowing) {

      isAnyDialogShowing = false;

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddEditAddressBloc>(
      create: (_) => addEditAddressBloc,

      child: BlocListener<AddEditAddressBloc, AddEditAddressState>(
        listener: (context, state) {

          if (state is AddEditAddressLoading) {
            dismissAllDialogs();
            showProgressDialog(state.progressMessage);
          }

          if (state is NewAddressAddedSuccessfully) {
            dismissAllDialogs();
            showSuccessfulDialog("Address Saved!");
          }

          if (state is AddressUpdatedSuccessfully) {
            dismissAllDialogs();
            showSuccessfulDialog("Address Updated!");
          }

          if (state is AddEditAddressError) {
            dismissAllDialogs();
            showErrorDialog(state.errorMessage);
          }

        },
        child: SafeArea(
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
                          addEditAddressBloc.add(UpdateAddress(widget.address));
                        } else {
                          addEditAddressBloc.add(AddNewAddress(widget.address));
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
