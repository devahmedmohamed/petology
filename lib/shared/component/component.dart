
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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
}) =>
    Card(
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