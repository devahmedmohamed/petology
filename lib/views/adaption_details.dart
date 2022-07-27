
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ServicesAdaptionView extends StatefulWidget {
  @override
  _ServicesViewState createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesAdaptionView> {
  @override
  Widget build(BuildContext context) {
    List<AssetImage> items = [
      AssetImage('assets/images/Dog.png'),
      AssetImage('assets/images/Dog.png'),
      AssetImage('assets/images/Dog.png'),
    ];
    CarouselController buttonCarouselController = CarouselController();
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          HexColor('#180701'),
                          HexColor('#654538'),
                        ])),
                child: CarouselSlider(
                  carouselController: buttonCarouselController,
                  items: items
                      .map(
                        (e) => Image(
                      image: AssetImage('${e.assetName}'),
                      width: double.infinity,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                      .toList(),
                  options: CarouselOptions(
                    height: 250.0,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(microseconds: 2000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: true,
                  ),
                ),
              ),
              PositionedDirectional(
                top: 80,
                end: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: Image(
                      image: const AssetImage('assets/images/Icon ionic-ios-.png'),
                      width: size.width * 1,
                      height: size.height * 1,
                    ),
                  ),
                ),
              ),
              PositionedDirectional(
                top: 80,
                start: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  child: InkWell(
                    onTap: () {

                      buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: Image(
                      image:
                      const AssetImage('assets/images/Icon ionic-ios- (1).png'),
                      width: size.width * 1,
                      height: size.height * 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          AdaptionContent()
        ],
      ),
    );
  }
}

class AdaptionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
      padding:  EdgeInsets.all(50),
      child: Column(

        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'Elsa',
            style: TextStyle(
                color: HexColor("492F24"),
                fontSize: 50,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(

            children: [
              Text(
                'Share by: ',
                style: TextStyle(
                  color: HexColor("492F24"),
                  fontSize: 30,

                ),
              ),
              Text(

                'Rawan tarek',

                style: TextStyle(
                    color: HexColor("492F24"),
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold


                ),
              ),
              Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 50,bottom: 30),
                child: Image(image: AssetImage('assets/images/image2.png')),
              )
            ],
          ),
          Row(
            children: [
              Text(
                'Domestic Short Hair  Fredericton, NB',
                style: TextStyle(
                  color: HexColor("492F24"),
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 10,bottom: 10),
            child: Container(
              width: size.width,
              color: HexColor('#F1F1F1'),
              child: Row(
                children: [
                  Text(
                    'Adult  Female  Medium  Tabby (Brown / Chocolate)',
                    style: TextStyle(
                        color: HexColor("492F24"),
                        fontSize: 30,
                        fontWeight: FontWeight.bold

                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'About',
                style: TextStyle(
                    color: HexColor("492F24"),
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'HOUSE-TRAINED \n\n Yes \n\n HEALTH\n\n Vaccinations up to date, spayed / neutered.\n\n GOOD IN A HOME WITH \n\n Other cats.\n\nPREFERS A HOME WITHOUT \n\nChildren.',
                style: TextStyle(
                  color: HexColor("492F24"),
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 10,bottom: 10),
            child: Container(
              width: size.width,
              color: HexColor('#F1F1F1'),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/image1.png',
                    ),
                  ),
                  const SizedBox(width: 50,),
                  Text(
                    'Petfinder recommends that you should always take reasonable \n\n security steps before making adabtion.',
                    style: TextStyle(
                        color: HexColor("492F24"),
                        fontSize: 30,
                        fontWeight: FontWeight.bold

                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Row(
              children: [
                Text(
                  'Meet Elsa'
                      '',
                  style: TextStyle(
                      color: HexColor("492F24"),
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Hi,\n\n Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clitakasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita'
                '\n\n\n kasd gubergren, '
                'no sea takimata sanctus est Lorem ipsum dolor sit amet.'
                ' Lorem ipsum dolor sit amet, consetetur sadipscing elitr,'
                ' sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
                ' sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. '
                'Stet clita kasd gubergren,'
                ' no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea.',
            style: TextStyle(
              color: HexColor("492F24"),
              fontSize: 30,

            ),
          ),


        ],
      ),
    );

  }
}