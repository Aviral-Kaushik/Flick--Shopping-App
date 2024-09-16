import 'package:flick/components/row_with_two_buttons.dart';
import 'package:flick/models/Address.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key, required this.showUIForSelectAddressScreen});

  final bool showUIForSelectAddressScreen;

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {

  List<Address> addresses = [
    Address(
        addressId: "1",
        userId: "1",
        address: "C 33, Inner Circle, Connaught Place, Delhi",
        pinCode: "110001",
        contactNumber: "1234567890"),
    Address(
        addressId: "1",
        userId: "1",
        address:
            "A - 45, Nand Vatika, Siwaya, Modipuram, Meerut, Uttar Pradesh",
        pinCode: "250001",
        contactNumber: "7896541235"),
    Address(
        addressId: "1",
        userId: "1",
        address:
            "H. No. 638. Jansath Road Bhood, Khatauli, Muzaffarnagar, Uttar Pradesh",
        pinCode: "250001",
        contactNumber: "7895848685"),
    Address(
        addressId: "1",
        userId: "1",
        address:
            "A103/2, Ahuna Divecha Complex B, Edulji Rd, Charai, Thane West, Mumbai, Maharashtra",
        pinCode: "400601",
        contactNumber: "1478745965"),
    Address(
        addressId: "1",
        userId: "1",
        address:
            "Indian Merchant Chamber Bldg, Opp Chruchgate Station, Churchgate, Mumbai, Maharashtra",
        pinCode: "400021",
        contactNumber: "8989562356"),
  ];

  addressHeader() {
    return Row(
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
        
        Text(widget.showUIForSelectAddressScreen
            ? "Select Address"
            : "Your Addresses", style: GoogleFonts.lato(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),)

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(
                  height: appPadding,
                ),

                addressHeader(),

                const SizedBox(
                  height: appPadding,
                ),

                Divider(
                  color: blackColor,
                ),

                const SizedBox(
                  height: appPadding,
                ),

                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (context, index) => AddressCard(
                    address: addresses[index],
                    showUIForSelectAddress: widget.showUIForSelectAddressScreen,
                  ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: appPadding * 1.5,
                    )
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatefulWidget {
  const AddressCard({super.key,
    required this.address, required this.showUIForSelectAddress});

  final Address address;
  final bool showUIForSelectAddress;

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
                      // TODO Navigate to Edit Address Screen and pop this screen
                    },
                    onSecondButtonPressed: () {
                      // TODO Handle delete address case
                    },
                    firstButtonColor: Colors.white,
                    secondButtonColor: Colors.redAccent),

              if (widget.showUIForSelectAddress)
                GestureDetector(
                  onTap: () {
                    isSelected = !isSelected;
                    setState(() {});
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: appPadding,
                          vertical: appPadding / 2),

                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(appPadding / 2)
                      ),

                      child: Center(
                        child: Text("Select this Address", style: TextStyle(
                            fontSize: 15,
                            color: whiteColor
                        ),
                        ),
                      )
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}

