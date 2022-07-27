import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../button_custom_component/ButtonCustom.dart';

Widget BuildCard(context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;

  return Card(
    color: Color(0xffeaeaea),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            //   height: height * .25,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image(
                    image: const AssetImage(
                      "assets/images/elsa.png",
                    ),
                    width: width * 0.4,
                    height: height * 0.4,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Elsa",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonCustom(
                  title: "See More",
                  onTap: () {},
                  height: height * .04,
                  width: width * .1,
                  icon: Icon(Icons.abc),
                  color: Colors.black,
                  color2: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
