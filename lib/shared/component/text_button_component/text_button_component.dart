import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget textButton({
  required Size size,
  required var isHover,
  required Function hoverFunction,
  required String text,
  Function()? onTap,
})=>Padding(
  padding: EdgeInsets.symmetric(horizontal:size.width*.01),
  child: InkWell(
    onHover:(value)
    {
      if(value){
        hoverFunction(true);
      }
      else hoverFunction(false);
      print(isHover);
    } ,
    onTap:onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style:TextStyle(
            color: Colors.grey[300],
            fontSize: 20,
            fontWeight: isHover?FontWeight.bold:FontWeight.w500
        ),),
        const SizedBox(height: 2,),
        if(isHover)
          Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true
              ,child: Container(
            width: 70,
            height:4 ,
            color:HexColor('#FFE3c5'),
          )

          )
      ],
    ),
  ),
);
