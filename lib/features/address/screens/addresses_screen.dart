import 'package:flick/components/row_with_two_buttons.dart';
import 'package:flick/components/simple_button.dart';
import 'package:flick/features/address/blocs/address_bloc/address_bloc.dart';
import 'package:flick/features/address/blocs/address_bloc/address_event.dart';
import 'package:flick/features/address/blocs/address_bloc/address_state.dart';
import 'package:flick/features/address/screens/add_edit_address_screen.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Address.dart';
import 'package:flick/models/User.dart';
import 'package:flick/models/pre_order.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressesScreen extends StatefulWidget {
  AddressesScreen({
    super.key,
    required this.showUIForSelectAddressScreen,
    this.preOrder});

  final bool showUIForSelectAddressScreen;
  PreOrder? preOrder;

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {

  final AddressBloc addressBloc = locator.get<AddressBloc>();

  late DialogHelper dialogHelper;
  List<Address>? addresses;

  bool isAnyDialogShowing = false;

  late User? user;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);

    if (widget.preOrder != null) {
      debugPrint("PreOrder Product length: ${widget.preOrder!.products.length}");
      debugPrint("PreOrder Quantity: ${widget.preOrder!.quantity}");
      debugPrint("PreOrder Total Price: ${widget.preOrder!.totalPriceAtCheckout}");
    }

    loadAddress();
  }

  void loadAddress() async {
    user = await User.instance;

    if (user != null) {
      addressBloc.add(LoadAddresses(user!.id));
    }
  }

  addressHeaderWithRefreshButton(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [

            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(appPadding / 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(appPadding / 2),
                    border: Border.all(color: Colors.black)
                ),
                child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20,),
              ),
            ),

            const SizedBox(
              width: appPadding * 2,
            ),

            Text(title, style: GoogleFonts.lato(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),)

          ],
        ),

        GestureDetector(
          onTap: () {
            if (user != null) {
              addressBloc.add(LoadAddresses(user!.id));
            }
          },
          child: Container(
            padding: const EdgeInsets.all(appPadding / 2),
            child: const Icon(Icons.refresh, color: Colors.black, size: 30,),
          ),
        ),
      ],
    );
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

  showDeleteAddressWarningDialog(String addressId) {
    isAnyDialogShowing = true;

    dialogHelper.showWarningDialog("Are you sure want to delete this address?",
        "Delete", "Cancel", () {
      addressBloc.add(DeleteAddress(user!.id, addressId));
        }, Colors.redAccent, () {
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
    return BlocProvider<AddressBloc>(
      create: (_) => addressBloc,

      child: BlocListener<AddressBloc, AddressState>(
        listener: (context, state) {

          if (state is AddressLoadingState) {
            dismissAllDialogs();
            showProgressDialog(state.progressMessage);
          }

          if (state is AddressLoaded) {
            dismissAllDialogs();
            addresses = state.addresses;
            setState(() {});
          }

          if (state is AddressError) {
            dismissAllDialogs();
            showErrorDialog(state.errorMessage);
          }

          if (state is AddressDeletedSuccessfully) {
            dismissAllDialogs();
            showSuccessfulDialog("Address Deleted Successfully!");
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: whiteColor,

            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: ClipRRect(
              borderRadius: BorderRadius.circular(appPadding * 8),

              child: FloatingActionButton(
                backgroundColor: blueThemeColor,
                onPressed: () {
                  Navigator.pushNamed(context, "/addEditAddressScreen",
                      arguments: AddEditAddressArguments(
                          address: Address(
                              addressId: "",
                              userId: "",
                              address: "",
                              pinCode: "",
                              contactNumber: ""),
                          showUiForEditAddressScreen: false));
                },
                child: const Icon(Icons.add, color: Colors.white,),
              ),
            ),

            body: Padding(
              padding: const EdgeInsets.all(appPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    const SizedBox(
                      height: appPadding,
                    ),

                    addressHeaderWithRefreshButton(widget.showUIForSelectAddressScreen
                        ? "Proceed to Checkout"
                        : "Your Addresses"),

                    const SizedBox(
                      height: appPadding,
                    ),

                    Divider(
                      color: blackColor,
                    ),

                    const SizedBox(
                      height: appPadding,
                    ),

                    if (addresses != null && addresses!.isNotEmpty)
                      ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:  addresses!.length ,
                        itemBuilder: (context, index) => AddressCard(
                          address: addresses![index],
                          showUIForSelectAddress: widget.showUIForSelectAddressScreen,
                          onDeleteButtonPressed: () {
                            showDeleteAddressWarningDialog(addresses![index].addressId);
                          },
                        ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: appPadding * 1.5,
                          )
                      ),

                    // if (addresses == null || (addresses != null && addresses!.isEmpty)
                    //   // TODO UI for No Address Saved Yet Case

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

class AddressCard extends StatefulWidget {
  const AddressCard(
      {super.key,
      required this.address,
      required this.showUIForSelectAddress,
      required this.onDeleteButtonPressed});

  final Address address;
  final bool showUIForSelectAddress;
  final Function() onDeleteButtonPressed;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 10 : 0,

      child: Container(

        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(appPadding / 2),

            border: Border.all(color: isSelected
                ? Colors.blueAccent.shade400
                : Colors.black12),

            boxShadow: [
              BoxShadow(
                  color: isSelected
                      ? Colors.blueAccent.shade400
                      : Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: isSelected ? const Offset(0, 0) : const Offset(0, 10),
              )
            ]),

        child: Padding(
          padding: const EdgeInsets.all(appPadding),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                widget.address.address,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: appPadding,),

              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 15
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "Pin Code: ", style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),

                    TextSpan(text: widget.address.pinCode)
                  ]
                ),
              ),

              const SizedBox(height: appPadding,),

              RichText(
                text: TextSpan(
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 15
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Contact Number: ", style: GoogleFonts.poppins(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),

                      TextSpan(text: widget.address.contactNumber)
                    ]
                ),
              ),

              const SizedBox(height: appPadding * 1.5,),

              if (!widget.showUIForSelectAddress)
                RowWithTwoButtonsWidget(
                    firstBtnTitle: "Edit Address",
                    secondBtnTitle: "Delete Address",
                    onFirstButtonPressed: () {
                      Navigator.pushNamed(context, "/addEditAddressScreen",
                          arguments: AddEditAddressArguments(
                              address: widget.address,
                              showUiForEditAddressScreen: true));
                    },
                    onSecondButtonPressed: widget.onDeleteButtonPressed,
                    firstButtonColor: Colors.white,
                    secondButtonColor: Colors.redAccent),

              if (widget.showUIForSelectAddress)
                SimpleButton(
                    buttonText: "Select this Address",
                    backgroundColor: Colors.blueAccent,
                    onPressed: () {
                      isSelected = !isSelected;
                      setState(() {});
                    })
            ],
          ),
        ),
      ),
    );
  }
}

