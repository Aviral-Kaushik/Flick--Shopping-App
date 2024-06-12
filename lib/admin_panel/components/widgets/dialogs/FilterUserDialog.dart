import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class FilterUserDialog extends StatefulWidget {
  const FilterUserDialog({super.key});

  @override
  State<FilterUserDialog> createState() => _FilterUserDialogState();
}

class _FilterUserDialogState extends State<FilterUserDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appPadding)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: filterUserDialogContent(),
    );
  }

  filterUserDialogContent() {
    bool isAToZChipSelected = false;
    bool isDateCreatedChipSelected = false;
    bool isAscendingChipSelected = false;
    bool isDescendingChipSelected = false;

    return Container(
      padding: const EdgeInsets.all(appPadding),

      decoration: BoxDecoration(
          color: whiteColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(appPadding),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0))
          ]),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Filter Users",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: textColor),
          ),

          const SizedBox(
            height: appPadding * 2,
          ),

          const Text(
            "Select Filter",
            style: TextStyle(fontSize: 16, color: textColor),
          ),

          const SizedBox(
            height: appPadding,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              FilterChip(
                label: const Text("A to Z"),
                selected: isAToZChipSelected,
                onSelected: (bool value) {
                  isAToZChipSelected = value;
                  setState() {}
                },
                selectedColor: Colors.greenAccent,
                selectedShadowColor: Colors.greenAccent.withOpacity(0.3),
              ),

              FilterChip(
                label: const Text("Date Created"),
                selected: isDateCreatedChipSelected,
                onSelected: (bool value) {
                  isDateCreatedChipSelected = value;
                  setState() {}
                },
                selectedColor: Colors.greenAccent,
                selectedShadowColor: Colors.greenAccent.withOpacity(0.3),
              ),
            ],
          ),

          const SizedBox(
            height: appPadding * 2,
          ),

          const Text(
            "Filter Type",
            style: TextStyle(fontSize: 16, color: textColor),
          ),

          const SizedBox(
            height: appPadding,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              FilterChip(
                label: const Text("Ascending"),
                selected: isAscendingChipSelected,
                onSelected: (bool value) {
                  isAscendingChipSelected = value;
                  setState() {}
                },
                selectedColor: Colors.greenAccent,
                selectedShadowColor: Colors.greenAccent.withOpacity(0.3),
              ),

              FilterChip(
                label: const Text("Descending"),
                selected: isDescendingChipSelected,
                onSelected: (bool value) {
                  isDescendingChipSelected = value;
                  setState() {}
                },
                selectedColor: Colors.greenAccent,
                selectedShadowColor: Colors.greenAccent.withOpacity(0.3),
              ),
            ],
          ),

          const SizedBox(
            height: appPadding * 2,
          ),
          Row(
            children: [

              const Expanded(
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
              )),

              const SizedBox(
                width: 4,
              ),

              Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: appPadding / 2),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(appPadding / 2)),
                    child: Center(
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            color: whiteTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
