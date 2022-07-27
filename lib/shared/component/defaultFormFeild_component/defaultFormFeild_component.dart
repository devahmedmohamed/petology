import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultFormField({
  var textColor,
  required TextEditingController controller,
  required TextInputType type,
  Function()? onSubmit,
  Function? onChange,
  Function()? onTap,
  bool isPassword = false,
  required Function validate,
  String? label,
  IconData? prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
  required double height,
  required double width,
  Iterable<String>? autofill
}) =>Card(
  elevation:5,
  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
  clipBehavior:Clip.hardEdge,
  child: Container(
    width: width,
    height: height,

    child: Center(
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,

        ),
        autofillHints:autofill,
        cursorColor: Colors.deepOrange,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted:(value)=>onSubmit,
        onChanged:(value)=> onChange,
        onTap: onTap,
        validator:validate(),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color:textColor,fontWeight: FontWeight.w500),
            prefixIcon: Icon(
              prefix,
            ),
            suffixIcon: suffix != null
                ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffix,
                color: HexColor('#492F24'),
              ),
            )
                : null,
            border:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0),

            ),enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                color: Colors.white
            ),
                borderRadius:BorderRadius.circular(25.0)

            )

        ),
      ),
    ),
  ),
);
