import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/views/home_view.dart';
import '../shared/component/component.dart';
import '../view_models/request_cubit/request_cubit.dart';
import '../view_models/request_cubit/request_state.dart';

class RequestView extends StatefulWidget {
  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RequestCubit, RequestStates>(
      listener: (BuildContext context, state) {
        if (state is RequestSuccessState) {
          RequestCubit.get(context).changeScreen(0);
          navigateAndEnd(context, HomeView());
        }
      },
      builder: (BuildContext context, Object? state) {
        var model = RequestCubit.get(context);
        var cubit = RequestCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(top: size.height * .1),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * .6, top: size.height * .28),
                  child: Image(
                    image: AssetImage(
                      'assets/images/Icon material-p (2).png',
                    ),
                    height: size.width * .5,
                    width: size.height * .5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * .13),
                  child: Image(
                    image: AssetImage(
                      'assets/images/Icon material-p (2).png',
                    ),
                    height: size.width * .5,
                    width: size.height * .5,
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          //Form Border
                          Center(
                            child: Container(
                              height: size.height * 2.6,
                              width: size.width * .5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: HexColor('#492F24'), width: 2),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * .08),
                                child: Text(
                                  'Request',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.brown[800]),
                                )),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * .00001),
                              child: const Image(
                                image:
                                    AssetImage('assets/images/requestDog.png'),
                                height: 600,
                                width: 600,
                              ),
                            ),
                          ),
                          //name form field
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .7),
                              child: defaultFormField(
                                label: 'Name',
                                height: size.height * .1,
                                width: size.width * .4,
                                controller: nameController,
                                type: TextInputType.name,
                                validate: () => (String? value) {
                                  if (value!.isEmpty) {
                                    return 'First Name Must not be Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .84),
                              child: myDropdown(
                                  height: size.height * .1,
                                  width: size.width * .4,
                                  dropItems: cubit.categories,
                                  selectedItem: cubit.selectedCategory,
                                  hintText: 'Category'),
                            ),
                          ),
                          Center(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * .98),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.years,
                                        selectedItem: cubit.selectedYear,
                                        hintText: 'Year'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.months,
                                        selectedItem: cubit.selectedMonth,
                                        hintText: 'Months'),
                                  ],
                                )),
                          ),
                          Center(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 1.1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.sizes,
                                        selectedItem: cubit.selectedSize,
                                        hintText: 'Size'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.breeds,
                                        selectedItem: cubit.selectedBreed,
                                        hintText: 'Breed'),
                                  ],
                                )),
                          ),
                          Center(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 1.22),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.genders,
                                        selectedItem: cubit.selectedGender,
                                        hintText: 'Gender'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.breeds,
                                        selectedItem: cubit.selectedBreed,
                                        hintText: 'Breed'),
                                  ],
                                )),
                          ),
                          Center(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 1.34),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.hairLengths,
                                        selectedItem: cubit.selectedHairLength,
                                        hintText: 'Hair Length'),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.behaviours,
                                        selectedItem: cubit.selectedBehaviour,
                                        hintText: 'Care & behavior'),
                                  ],
                                )),
                          ),
                          Center(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 1.46),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.houseTrained,
                                        selectedItem:
                                            cubit.selectedHouseTrained,
                                        hintText: 'House Trained'),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    myDropdown(
                                        height: size.height * .1,
                                        width: size.width * .192,
                                        dropItems: cubit.dogColor,
                                        selectedItem: cubit.selectedDogColor,
                                        hintText: 'Color'),
                                  ],
                                )),
                          ),
                          // Detect your current location
                          Center(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 1.6,
                                    right: size.width * .22),
                                child: Text(
                                  'Detect your current location',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.brown[800]),
                                )),
                          ),
                          //Location
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * 1.66),
                              child: defaultFormField(
                                suffix: Icons.location_on,
                                textColor: HexColor('#A69994'),
                                label: 'Location',
                                height: size.height * .1,
                                width: size.width * .4,
                                controller: locationController,
                                type: TextInputType.name,
                                validate: () => (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Location Must not be Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          //phone
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * 1.78),
                              child: defaultFormField(
                                textColor: HexColor('#A69994'),
                                label: 'Phone Number',
                                height: size.height * .1,
                                width: size.width * .4,
                                controller: phoneController,
                                type: TextInputType.name,
                                validate: () => (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Phone number Must not be Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          //Description
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * 1.9),
                              child: defaultFormField(
                                textColor: HexColor('#A69994'),
                                label: 'Description',
                                height: size.height * .32,
                                width: size.width * .4,
                                controller: descriptionController,
                                type: TextInputType.name,
                                validate: () => (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Phone number Must not be Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          //text vaccinated (up to date)
                          Center(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 2.25,
                                    right: size.width * .21),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'vaccinated (up to date)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.brown[800]),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Transform.scale(
                                      scale: 1.3,
                                      child: Checkbox(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          fillColor: MaterialStateProperty
                                              .resolveWith<Color>((states) {
                                            if (states.contains(
                                                MaterialState.disabled)) {
                                              return Colors.brown;
                                            }
                                            return Colors.brown;
                                          }),
                                          checkColor: HexColor('#FFE3C5'),
                                          value: cubit.checkValue,
                                          onChanged: (value) {
                                            cubit.changeCheckBoxValue();
                                          }),
                                    )
                                  ],
                                )),
                          ),
                          //Send Button
                          Center(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 2.38),
                                child: myDefaultButton(
                                    height: size.height * .11,
                                    width: size.width * .4,
                                    onPressed: () {
                                      RequestCubit.get(context).dogData(
                                        phone: phoneController.text,
                                        description: descriptionController.text,
                                        name: nameController.text,
                                        category: model.selectedCategory,
                                        breed: model.selectedBreed,
                                        year: model.selectedYear,
                                        size: model.selectedSize,
                                        goodWith: model.selectedGood,
                                        gender: model.selectedGender,
                                        color: model.selectedDogColor,
                                        hairLength: model.selectedHairLength,
                                        careBehavior: model.selectedBehaviour,
                                        location: locationController.text,
                                        month: model.selectedMonth,
                                        houseTrained:
                                            model.selectedHouseTrained,
                                      );
                                    },
                                    text: 'Send')),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
