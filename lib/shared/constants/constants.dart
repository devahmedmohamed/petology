import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:petology/shared/network/local/cache_helper.dart';

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
const Color primaryColor = Color(0xff56392D);
const Color secondaryColor = Color(0xffFFE3C5);
const Color gradientFirstColor = Color(0xff674739);
const Color gradientSecondColor = Color(0xff180701);
const textColorDrawer = Colors.white;
const iconColorDrawer = Colors.white;
const shadowColor = Color.fromRGBO(143, 148, 251, .2);

const kRedColor = Color(0xFFE92E30);
const kGrayColor = Colors.grey;
const kBlackColor = Color(0xFF101010);
const double kDefaultPadding = 20.0;



void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
int index=0 ;
int catId= 1;

String token = '';
var item1 = '';
var item2='';
var item3='';
var item4='';
var item5='';
var item6='';


Color color=Colors.white;





