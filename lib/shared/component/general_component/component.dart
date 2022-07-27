
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';



void navigateAndEnd(context,widget)=>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=>widget,),
      result: (Route<dynamic> route)=>false,

    );


void navigateTo(context, widget) => Navigator.push(

  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);



Widget myDivider({

  required double width
}) => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 15.0,
    end: 15.0
  ),
  child: Container(
    width: width,
    height: 2.0,
    color: Colors.black,
  ),
);






Widget myDefaultTextButton({
  required String text,
  required Function() onPressed

})=> TextButton(
  onPressed:onPressed,
  child: Text('$text',
    style: TextStyle(color: Colors.brown[800],
        fontWeight: FontWeight.w600,
        fontSize: 17
    ),
  ),
);



