import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../shared/component/component.dart';
import '../shared/component/grid_view_component/grid_view_item.dart';
import '../shared/constants/constants.dart';
import '../view_models/adaption_cubit/adaption_cubit.dart';
import '../view_models/adaption_cubit/adaption_state.dart';
import 'home_view.dart';

class AdaptionSearchView extends StatefulWidget {
  const AdaptionSearchView({Key? key}) : super(key: key);

  @override
  State<AdaptionSearchView> createState() => _AdaptionSearchViewState();
}

class _AdaptionSearchViewState extends State<AdaptionSearchView> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    List<String> items = ['!', '@','&', '#'];
    return  BlocConsumer<AdaptionCubit,AdaptionState>(
      listener: (BuildContext context, state) {
        if(state is FilterGridSuccessState){



        }


       var model =AdaptionCubit.get(context).filterGridModel;
      },

      builder: (BuildContext context, Object? state) {

        return Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Image(
                image: const AssetImage(
                  "assets/images/leg.png",
                ),
                width: w * 0.4,
                height: h * 0.4,
                color: HexColor("#FFE3C5"),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: RotatedBox(
                quarterTurns: 2,
                child: Image(
                  image: const AssetImage(
                    "assets/images/leg.png",
                  ),
                  width: w * 0.4,
                  height: h * 0.4,
                  color: HexColor("#FFE3C5"),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: h * .500,
              child: Image(
                image: AssetImage(
                  "assets/images/leg.png",
                ),
                color: HexColor("#FFE3C5"),
                width: w * 0.4,
                height: h * 0.4,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 200.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Breed",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Age",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Size",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Good with",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            myDropdown(
                              height: h * 0.07,
                              width: w * 0.13,
                              dropItems:items,
                              selectedItem: items[0] ,
                              hintText: "Breed",
                            ),
                            myDropdown(
                              height: h * 0.07,
                              width: w * 0.13,
                              dropItems: items,
                              selectedItem: items[0],
                              hintText: "Age",
                            ),
                            myDropdown(
                              height: h * 0.07,
                              width: w * 0.13,
                              dropItems: items,
                              selectedItem: items[0],
                              hintText: "Size",
                            ),
                            myDropdown(
                              height: h * 0.07,
                              width: w * 0.13,
                              dropItems: items,
                              selectedItem: items[0],
                              hintText: "Good With",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 200.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Color",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Hair Length",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Care & Behavior",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            myDropdown(
                              height: h * 0.07,
                              width: w * 0.13,
                              dropItems: items,
                              selectedItem: items[0],
                              hintText: "Gender",
                            ),
                            myDropdown(
                              height: h * 0.07,
                              width: w * 0.13,
                              dropItems: items,
                              selectedItem: items[0],
                              hintText: "Color",
                            ),
                            myDropdown(
                              height: h * 0.07,
                              width: w * 0.13,
                              dropItems: items,
                              selectedItem: items[0],
                              hintText:"Length",
                            ),
                            myDropdown(
                              height: h * 0.07,
                              width: w * 0.13,
                              dropItems: items,
                              selectedItem: items[0],
                              hintText: "Care",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: h * .7,
                        width: w * .7,
                        //want to make grid view here
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,
                              width:5,
                            ),
                            borderRadius: BorderRadius.circular(25.0),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GridView.builder(
                              itemCount: 9,
                              gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
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
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child:TextButton(
                          onPressed:(){
                            setState(() {
                              index=7;
                            });
                            navigateAndEnd(context, HomeView());
                          } ,
                          child: Text(
                            "Show more.....",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],

        );
      },
    );

  }
}
