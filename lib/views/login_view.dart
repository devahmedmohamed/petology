import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/view_models/login_cubit/login_states.dart';

import '../shared/component/component.dart';
import '../shared/constants/constants.dart';
import '../shared/network/local/cache_helper.dart';
import '../view_models/login_cubit/login_cubit.dart';
import 'home_view.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (BuildContext context, Object? state) {
        if(state is LoginSuccessState)
        {

          if(state.loginModel.accessToken != null)
          {

            CacheHelper.saveData(
              key: 'accessToken',
              value: state.loginModel.accessToken,
            ).then((value) {
              token = state.loginModel.accessToken!;

            });

            LoginCubit.get(context).changeScreen(0);
            navigateAndEnd(context, HomeView());

          }
        }
      },
      builder: (BuildContext context, state) {
        return Padding(
          padding: EdgeInsets.only(top:size.height*.1),
          child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.only(bottom:200),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top:size.height*.3545),
                            child: Container(
                              height:size.height*1.05 ,
                              width:size.width*.5 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color:HexColor('#492F24'),width:2),

                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height:size.height*.37 ,
                            width:size.width*.37 ,
                            child: Image(height:size.height*.37 ,width:size.height*.37 ,image: const AssetImage(
                              'assets/images/Dog.png',

                            ),),
                          ),
                        ),
                        Center(
                          child: Padding(
                              padding: EdgeInsets.only(top: size.height*.4),
                              child:Text('Login',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.brown[800]
                              ),)
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height*.55),
                            child: defaultFormField(
                              autofill: [
                                AutofillHints.email,
                                AutofillHints.password,
                              ],

                              label:'Email',
                              height:size.height*.1 ,
                              width:size.width*.4 ,
                              controller: emailController,
                              type:TextInputType.emailAddress,
                              validate:()=>  (String? email){

                                  if(email!.isEmpty){
                                    return 'Please Enter Your Email Address';
                                  }/*else if(!EmailValidator.validate(email))
                                  {
                                    return 'Enter a valid email';
                                  }*/else {
                                    return null;
                                  }
                                }
                              ,

                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height*.69),
                            child: defaultFormField(
                              label: 'Password',
                              height:size.height*.1 ,
                              width:size.width*.4 ,

                              controller: passwordController,
                              type:TextInputType.visiblePassword,
                              validate:()=>  (String? value){
                                if(value!.isEmpty){
                                  return 'Password Must not be Empty';
                                }

                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                              padding: EdgeInsets.only(top:size.height*.865),
                              child: myDefaultButton(
                                  height: size.height*.11,
                                  width: size.width*.4,
                                  onPressed: (){
                                    print('hhhh');
                                   // if(formKey.currentState!.validate())
                                    {
                                      LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,);



                                    }
                                  },

                                  text: 'Login'
                              )
                          ),
                        ),
                        Center(
                          child: Padding(
                              padding: EdgeInsets.only(top:size.height,left: size.width*.28),
                              child:myDefaultTextButton(text: 'Forget Password?',
                                  onPressed:(){
                                print('ahaa');
                                  })

                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top:size.height*1.08),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myDivider(width: size.width*.18),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:15),
                                  child: Text('Or',style: TextStyle(
                                      color: Colors.brown[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17
                                  ),),
                                ),
                                myDivider(width: size.width*.18),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top:size.height*1.16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myDefaultButton2(
                                    width:size.width*.165 ,
                                    hight:size.height*.09 ,
                                    text: 'Facebook',
                                    textColor: Colors.white,
                                    color: HexColor('#2F4582'),
                                    image: 'assets/images/facebook.png'
                                ),
                                const SizedBox(width:100 ,),
                                myDefaultButton2(
                                    width:size.width*.165 ,
                                    hight:size.height*.09 ,
                                    text: 'Google',
                                    textColor: Colors.black,
                                    color: Colors.white,
                                    image: 'assets/images/google.png'
                                ),

                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top:size.height*1.3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                const Text('Don\'t have an account?',style:
                                TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.w600
                                ),),
                                myDefaultTextButton(
                                    text: 'sign up',
                                    onPressed:(){})
                              ],),
                          ),
                        )



                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
