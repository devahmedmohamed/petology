import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget myDropdown({
  required double height,
  required double width,
  required List dropItems,
  required String selectedItem,
  required String hintText


})=>Card(

  elevation: 5,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)),
  child: Container(
    height:height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: DropdownButtonFormField2(
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none
        //Add more decoration as you want here
      ),
      isExpanded: true,
      hint:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          hintText,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,

              color:  HexColor('#A69994')
          ),

        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.keyboard_arrow_down,
          color: HexColor('#492F24'),
        ),
      ),
      iconSize: 30,
      buttonHeight: 150,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      items: dropItems
          .map((item) =>
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
      },
      onChanged: (value) {
        //Do something when changing the item if you want.
      },
      onSaved: (value) {
        selectedItem = value.toString();
      },
    ),
  ),
);