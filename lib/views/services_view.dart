import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../shared/component/button_custom_component/ButtonCustom.dart';
import '../shared/component/component.dart';
import '../shared/constants/constants.dart';
import '../view_models/services_view_model/services_cubit.dart';
import '../view_models/services_view_model/services_state.dart';


class ServicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var locationController = TextEditingController();
    var phoneController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return BlocConsumer<ServicesCubit,ServicesState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state)
        {
          var cubit=ServicesCubit.get(context);
          return Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image(
                  image: AssetImage(
                    "assets/images/leg.png",
                  ),
                  width: size.width * 0.4,
                  height: size.height * 0.4,
                  color: HexColor("#FFE3C5"),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Image(
                    image: AssetImage(
                      "assets/images/leg.png",
                    ),
                    width: size.width * 0.4,
                    height: size.height * 0.4,
                    color: HexColor("#FFE3C5"),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: size.height * .500,
                child: Image(
                  image: AssetImage(
                    "assets/images/leg.png",
                  ),
                  color: HexColor("#FFE3C5"),
                  width: size.width * 0.4,
                  height: size.height * 0.4,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:60,bottom:60),
                  child: Container(
                    width: size.width * 0.37,
                    height: size.height *1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: gradientSecondColor,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Help your friend",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#492F24'),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Container(
                            child: InkWell(
                                onTap: ()
                                {
                                  // cubit.imagePicker();
                                },
                                child:
                                // cubit.imageAvailable?

                                Image(image:AssetImage("assets/images/camera.png"),
                                  width: size.width * .05,
                                  height: size.height * .05,)
                              //           :
                              // Image.memory(cubit.imageFile),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        myDropdown(
                          height: size.height * 0.1,
                          width: size.width * 0.27,
                          dropItems: cubit.categories,
                          selectedItem: cubit.selectedCategory,
                          hintText: "Category",
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right:size.width*.14),
                          child: Text(
                            "Detect your current location",
                            style: TextStyle(fontWeight: FontWeight.bold
                                ,color: HexColor('#492F24')
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        defaultFormField(
                          controller: locationController,
                          type:TextInputType.text,
                          validate:  () => (String? value) {
                            if (value!.isEmpty) {
                              return 'Location Must not be Empty';
                            }
                          },
                          height: size.height * 0.1,
                          width: size.width * 0.27,
                          label: "Location",
                          suffix: Icons.location_on_outlined,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(controller: phoneController,
                          type:TextInputType.phone,
                          validate:  () => (String? value) {
                            if (value!.isEmpty) {
                              return 'Phone Must not be Empty';
                            }
                          },
                          height: size.height * 0.1,
                          width: size.width * 0.27,
                          label: "Number Phone",
                          suffix: Icons.phone,),

                        SizedBox(
                          height: 60,
                        ),
                        ButtonCustom(
                          title: "Send",
                          height: size.height * 0.06,
                          width: size.width * 0.27,
                          onTap: ()
                          {
                            cubit.postServices(
                                imageBase64: '',
                                categoryId: cubit.selectedCategory,
                                location: locationController.text,
                                phoneNumber: phoneController.text
                            );
                          },
                          color2: primaryColor,
                          icon: Icon(Icons.ice_skating),
                          color: Color(0xffffe3c5),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ButtonCustom(
                          color2: primaryColor,
                          color: Color(0xffffe3c5),
                          title: "Call",
                          onTap: () {},
                          height: size.height * 0.06,
                          width: size.width * 0.27,
                          icon: Icon(Icons.ice_skating),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          );

        });
  }
}