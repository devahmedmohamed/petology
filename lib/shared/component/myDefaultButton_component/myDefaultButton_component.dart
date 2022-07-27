import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget myDefaultButton({
  double? height,
  double? width,
  String? text,
  Function()? onPressed
})=>Container(
  height:height ,
  width:width ,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(35),
      color: Colors.brown[800]
  ),
  child: MaterialButton(
    onPressed: onPressed,
    child: Text('$text',style: TextStyle(
        color: HexColor('#FFE3C5'),
        fontWeight: FontWeight.bold,
        fontSize: 30
    ),
    ),
  ),
);

Widget myDefaultButton2({
  double? hight,
  double? width,
  String? text,
  Function()? onPressed,
  Color? color,
  Color? textColor,
  String? image
})=>Container(
  height:hight ,
  width:width ,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(35),
      color:color,
      border:Border.all(color: Colors.grey)
  ),
  child: MaterialButton(
      onPressed:onPressed,
      child:Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Image(image:AssetImage('$image',),
              width:35 ,
              height:35 ,),
          ),
          SizedBox(width:20,),
          Center(
            child: Text('$text',style: TextStyle(
                color:textColor,
                fontWeight: FontWeight.bold,
                fontSize: 23
            ),
            ),
          ),
        ],
      )
  ),
);