import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/shared/component/myDefaultButton_component/myDefaultButton_component.dart';
import '../shared/component/general_component/component.dart';
import '../shared/component/grid_view_component/grid_view_item.dart';
import '../shared/constants/constants.dart';
import '../view_models/about_cubit/about_us_cubit.dart';
import 'home_view.dart';

class AboutUSView extends StatefulWidget {
  @override
  _AboutUSViewState createState() => _AboutUSViewState();
}

class _AboutUSViewState extends State<AboutUSView> {
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var bodyController = TextEditingController();
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocConsumer<AboutUsCubit, AboutUsState>(
      listener: (context, state) {

          var model = AboutUsCubit.get(context).aboutsModel;

          titleController.text = model.title as String;
          bodyController.text = model.body as String;

      },
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.7,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors: [
                        HexColor('#180701'),
                        HexColor('#654538'),
                      ])),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * .05),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'Not only people\nneed a house',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * .2,
                                    left: size.width * .01),
                                child: Container(
                                  width: size.width * .26,
                                  height: size.height * .6,
                                  child: Text(
                                    'Lorem ipsum dolor sit amet,'
                                    ' consetetur sadipscing elitr,'
                                    ' sed diam nonumy eirmod tempor invidunt ut labore et'
                                    ' dolore magna aliquyam erat, sed diam voluptua.'
                                    ' At vero eos et accusam et justo duo dolores et ea rebum.'
                                    ' Stet clita kasd gubergren,'
                                    ' no sea takimata sanctus est'
                                    ' Lorem ipsum dolor sit amet.'
                                    ' Lorem ipsum dolor sit amet,'
                                    ' consetetur sadipscing elitr,'
                                    ' sed diam nonumy.',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * .49,
                                  left: size.width * .01,
                                ),
                                child: myDefaultButton2(
                                    onPressed: () {},
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    text: 'Help Them',
                                    width: size.width * .25,
                                    height: size.height * .1,
                                    icon: true),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * .2,
                        right: size.width * .1,
                      ),
                      child: Image(
                        image: AssetImage('assets/images/image1.png'),
                        height: 400,
                        width: 400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: size.height * 0.7,
                  width: size.width,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * .2,
                        right: size.width * .1,
                      ),
                      child: Image(
                        image: AssetImage('assets/images/image2.png'),
                        height: 400,
                        width: 400,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.width * .1,
                          horizontal: size.height * .1),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Text(
                                titleController.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * .2,
                                    left: size.width * .01),
                                child: Container(
                                  width: size.width * .26,
                                  height: size.height * .6,
                                  child: Text(
                                    bodyController.text,

                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(

              children: [
                Container(
                  height: size.height * 0.6,
                  width: size.width,
                  color: Colors.grey[200],
                ),
                Padding(
                  padding: EdgeInsets.only(left:size.width*.38,top:20 ),
                  child: Text(
                    'Let\'s get this right .....',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:size.width*.35,top:90 ),
                  child: Text(
                    'What kind of friend you looking for?',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
                //cat
                InkWell(
                  onTap: (){
                    print('asa');

                    AboutUsCubit.get(context).changeScreen(6);
                    navigateAndEnd(context, HomeView());

                  },
                  child: Padding(
                    padding: EdgeInsets.only(left:size.width*.37,top:200 ),
                    child: Container(
                        height:150 ,
                        width:150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:HexColor('#492F24'),width:2),

                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image(image: AssetImage('assets/images/caty.png',),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0,top: 120),
                              child: Text('Cats',style: TextStyle(fontSize: 20),),
                            ),

                          ],
                        )),
                  ),
                ),
                //dog
                InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: EdgeInsets.only(left:size.width*.52,top:200 ),
                    child: Container(
                        height:150 ,
                        width:150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:HexColor('#492F24'),width:2),

                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image(image: AssetImage('assets/images/dogy.png',),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0,top: 120),
                              child: Text('Dogs',style: TextStyle(fontSize: 20),),
                            ),

                          ],
                        )),
                  ),
                ),






              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '  Our friends who \nlooking for a house',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black),
                ),
              ],
            ),
            Container(
              height: h * .6,
              width: w * .6,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: .8,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 300,
                  ),
                  itemBuilder: (context, index) {
                    return BuildCard(context);

                  },
                ),
              ),
            ),
            myDefaultButton2(
                onPressed: () {
                  setState(() {
                    index=6;
                  });
                  AboutUsCubit.get(context).changeScreen(6);
                  navigateAndEnd(context, HomeView());
                },
                color: HexColor('#492F24'),
                textColor: HexColor('#D8BDA3'),
                text: 'Show more',
                width: size.width * .24,
                height: size.height * .1,
                icon: true),
            Container(
              color: HexColor('#F1F1F1'),
              width: size.width,
              height: size.height * 1,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(
                      'How to take care of \n     your friends? ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: size.width,
                        height: size.height * .3,
                        child: Image(
                          image: AssetImage(
                              'assets/images/CompositeLayer (3).png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: size.width,
                        height: size.height * .3,
                        child: Image(
                          image: AssetImage(
                              'assets/images/CompositeLayer (4).png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
//AboutUsCubit.get(context).changeScreen(6);

class AdaptionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          'How you feed Your Dog?',
          style: TextStyle(
              color: HexColor("492F24"),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "As a general rule, puppies and young dogs burn more calories, so they need a greater quantity of food that is higher in protein and fat. Older, less active dogs require fewer calories to remain healthy.\n\n"
          "Richard H. Pitcairn, DVM, PhD, author of Dr. Pitcairn’s Complete Guide to Natural Health for Dogs and Cats, believes the most reliable approach is to feed what seems to be a reasonable amount and monitor his body weight.\n\n"
          "You should be able to feel your pet’s ribs easily as you slide your hand over his sides,” Pitcairn says. “If you can’t, he’s probably too heavy, so begin to feed a smaller quantity.\n\n"
          "If you’re using a commercial pet food, beware of the “feeding guidelines” on the bag or box.It lists different weights and the corresponding amount of food to feed your dog to maintain that weight,\nand should be used only as a rough guideline.\n\n"
          "Starting at the low end of the suggested guidelines and then monitoring your dog for hunger and \nbody condition is a good way to proceed.\nDifferent Portions for Different Pooches Though it may sound counterintuitive, as a general rule, \n\n ",
          style: TextStyle(
            color: HexColor("492F24"),
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
