import 'package:flutter/material.dart';
import 'dart:ui';
import '../network/local/cache_helper.dart';

const Color kBgColor = Color(0xFFecf5fb);
const Color kOrangeColor = Color(0xFFF07662);
const Color kDarkGreyColor = Color.fromARGB(255, 59, 78, 90);
const Color kGreenColor = Color(0xA8C7DCE5);
const Color kBlueColor = Color(0x3B4E5A);
const defaultColor = Colors.blue;
bool isDark=false;
void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      /*navigateAndFinish(
        context,
        ParkingLoginScreen(),
      );*/
    }
  });
}



void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
var uid = '';
String firstname='';
String email='';
String phone='';
String lastname='';
String country='';
String oldPassword='';
String newPassword='';

Color color=Colors.white;




int index = 0;

