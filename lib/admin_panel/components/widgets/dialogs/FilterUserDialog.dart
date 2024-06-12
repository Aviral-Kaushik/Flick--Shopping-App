import 'package:flick/admin_panel/helper/UserFilter.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class FilterUserDialog extends StatefulWidget {
  const FilterUserDialog({super.key, required this.filterToBeApplied});

  final Function(UserFilter) filterToBeApplied;

  @override
  State<FilterUserDialog> createState() => _FilterUserDialogState();
}

class _FilterUserDialogState extends State<FilterUserDialog> {

  bool isAToZChipSelected = false;
  bool isDateCreatedChipSelected = false;
  bool isAscendingChipSelected = false;
  bool isDescendingChipSelected = false;

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
                  setState(() {
                    isAToZChipSelected = value;
                    isDateCreatedChipSelected = false;
                  });
                },
                selectedColor: Colors.greenAccent,
                selectedShadowColor: Colors.greenAccent.withOpacity(0.3),
              ),

              FilterChip(
                label: const Text("Date Created"),
                selected: isDateCreatedChipSelected,
                onSelected: (bool value) {
                  setState(() {
                    isDateCreatedChipSelected = value;
                    isAToZChipSelected = false;
                  });
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
                  setState(() {
                    isAscendingChipSelected = value;
                    isDescendingChipSelected = false;
                  });
                },
                selectedColor: Colors.greenAccent,
                selectedShadowColor: Colors.greenAccent.withOpacity(0.3),
              ),

              FilterChip(
                label: const Text("Descending"),
                selected: isDescendingChipSelected,
                onSelected: (bool value) {
                  setState(() {
                    isDescendingChipSelected = value;
                    isAscendingChipSelected = false;
                  });
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

              Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
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
                    child: GestureDetector(
                      onTap: () {
                        widget.filterToBeApplied(UserFilter(
                            isAToZChipSelected ? "A to Z" : (isDateCreatedChipSelected ? "Date Created" : ""),
                            isAscendingChipSelected ? true : false));

                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              color: whiteTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  fetchSelectedFiltersAndPopFilterDialog() {

  }
}
