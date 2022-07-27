import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/component/component.dart';
import '../shared/constants/constants.dart';
import '../shared/network/local/cache_helper.dart';
import '../view_models/register_cubit/register_cubit.dart';
import '../view_models/register_cubit/register_states.dart';
import 'home_view.dart';
class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var rePasswordController = TextEditingController();
    var countryController = TextEditingController();
    var dropController = TextEditingController();
    var phoneController = TextEditingController();
    List item=['Egypt','Russia','England','UnitedStats'];
    String selectedItem=item[0];

    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, state) {
        if (state is RegisterSuccessState) {
          if (state.loginModel.accessToken != null) {
            CacheHelper.saveData(
                    key: 'accessToken', value: state.loginModel.accessToken)
                .then((value) {
              token = state.loginModel.accessToken!;
            });
            RegisterCubit.get(context).changeScreen(0);
            navigateAndEnd(context, HomeView());

          }
        }
      },
      builder: (BuildContext context, Object? state) {
        return Padding(
          padding: EdgeInsets.only(top: size.height * .1),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .218),
                  child: const Image(
                      image:
                          AssetImage('assets/images/Icon material-p (1).png')),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * .68, top: size.height * 1.27),
                  child: const Image(
                      image: AssetImage('assets/images/Icon material-p.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * .6, top: size.height * .28),
                  child: Image(
                    image: const AssetImage(
                      'assets/images/Icon material-p (2).png',
                    ),
                    height: size.width * .5,
                    width: size.height * .5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * .13),
                  child: Image(
                    image: const AssetImage(
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
                          Center(
                            child: Container(
                              height: size.height * 1.37,
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
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.brown[800]),
                                )),
                          ),
                          //Facebook & google
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  myDefaultButton2(
                                      width: size.width * .165,
                                      hight: size.height * .09,
                                      text: 'Facebook',
                                      textColor: Colors.white,
                                      color: HexColor('#2F4582'),
                                      image: 'Assets/images/facebook.png'),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  myDefaultButton2(
                                      width: size.width * .165,
                                      hight: size.height * .09,
                                      text: 'Google',
                                      textColor: Colors.black,
                                      color: Colors.white,
                                      image: 'Assets/images/google.png'),
                                ],
                              ),
                            ),
                          ),
                          //OR
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  myDivider(width: size.width * .18),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text(
                                      'Or',
                                      style: TextStyle(
                                          color: Colors.brown[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  myDivider(width: size.width * .18),
                                ],
                              ),
                            ),
                          ),
                          //First Name
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .37),
                              child: defaultFormField(
                                label: 'First Name',
                                height: size.height * .1,
                                width: size.width * .4,
                                controller: firstNameController,
                                type: TextInputType.name,
                                validate: () => (String? value) {
                                  if (value!.isEmpty) {
                                    return 'First Name Must not be Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          //Last Name
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .5),
                              child: defaultFormField(
                                label: 'Last Name',
                                height: size.height * .1,
                                width: size.width * .4,
                                controller: lastNameController,
                                type: TextInputType.visiblePassword,
                                validate: () => (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Last Name Must not be Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          //Email
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .627),
                              child: defaultFormField(
                                label: 'Email',
                                height: size.height * .1,
                                width: size.width * .4,
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                validate: () => (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Last Name Must not be Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          //Password
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .754),
                              child: defaultFormField(
                                label: 'Password',
                                height: size.height * .1,
                                width: size.width * .4,
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                validate: () => (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Password Must not be Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          //Re Enter Pass

                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: size.height * .878),
                                  child: defaultFormField(
                                    label: 'Re-Enter Password',
                                    height: size.height * .1,
                                    width: size.width * .4,
                                    controller: dropController,
                                    type: TextInputType.visiblePassword,
                                    validate: () => (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter re Password';
                                      }
                                      if (passwordController.text !=
                                          rePasswordController.text) {
                                        return 'Password don\'t match';
                                      }
                                    },
                                  ),
                                ),
                              ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * 1),
                              child:myDropdown(
                                  height: size.height * .1,
                                  width: size.width * .4,
                                  dropItems: item,
                                  selectedItem: selectedItem,
                                  hintText: 'Country',),



                              /*defaultFormField(
                                label: 'Country',
                                height: size.height * .1,
                                width: size.width * .4,
                                controller: countryController,
                                type: TextInputType.visiblePassword,
                                validate: () => (String? value) {
                                 *//* if (value!.isEmpty) {
                                    return 'Please Enter re Password';
                                  }
                                  if (passwordController.text !=
                                      rePasswordController.text) {
                                    return 'Password don\'t match';
                                  }*//*
                                },
                              ),*/
                            ),
                          ),

                          Center(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 1.15),
                                child: myDefaultButton(
                                    height: size.height * .11,
                                    width: size.width * .4,
                                    onPressed: () {
                                      RegisterCubit.get(context).userRegister(
                                          firstname: firstNameController.text,
                                          lastname: lastNameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phoneNumber: phoneController.text,
                                          country: countryController.text);
                                    },
                                    text: 'Sign up')),
                          ),
                          Center(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: size.height, left: size.width * 3),
                                child: myDefaultTextButton(
                                    text: 'Forget Password?',
                                    onPressed: () {})),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * 1.3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already Have Account ?',
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  myDefaultTextButton(
                                    text: 'Login',
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
