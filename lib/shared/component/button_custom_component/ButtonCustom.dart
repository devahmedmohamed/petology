import 'package:flutter/material.dart';
import '../../constants/constants.dart';


class ButtonCustom extends StatelessWidget {
  final String title;
  final Color color;
  final Color color2;
  final double width;
  final double  height;
  final Icon icon;
  final VoidCallback onTap;

  const ButtonCustom(
      { required this.title,
      required this.color,
      required this.color2,
      required this.width,
      required this.height,
       required this.onTap,
        required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(              width: 400,
      height:height?? 50,
      child: ElevatedButton(
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: color2??secondaryColor , fontSize: 20),
        ),
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary:color?? primaryColor,
          onPrimary: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
