import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/view_models/home_cubit/HomeState.dart';
import '../shared/component/component.dart';
import '../shared/constants/constants.dart';
import '../view_models/home_cubit/home_cubit.dart';
import 'about_us_view.dart';
import 'adaption_search_view.dart';
import 'login_view.dart';

class HomeView extends StatefulWidget {
   HomeView({Key? key}) : super(key: key);
    @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override





  var isHover =[false,false,false,false,false,false];
  var emailController=TextEditingController();
  var locationController=TextEditingController();
  var location2Controller=TextEditingController();
  var phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit,HomeState>(
      listener: (BuildContext context, state) {

        var model = HomeCubit.get(context).footerModel;

        emailController.text = model.email as String;
        locationController.text = model.location as String;
        location2Controller.text = model.location2 as String;
        phoneController.text=model.phone as String;
      },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar:PreferredSize(
            preferredSize:Size(size.width,80),
            child:Container(
              decoration:  BoxDecoration(
                  gradient:LinearGradient(begin:Alignment.bottomRight ,
                      end:Alignment.topLeft ,
                      colors:
                      [
                        HexColor('#190801'),
                        HexColor('#432A20'),
                      ])
              ),
              child: Padding(
                padding:  const EdgeInsets.all(20.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:size.width*.02 ,
                      ),
                      const Image(image:  AssetImage('assets/images/petology.png'),),
                      const Spacer(),
                      textButton(size: size,
                          isHover: index==0?true:isHover[0],
                          hoverFunction:(value)=>setState(() {
                            isHover[0]=value;
                          }),
                          text: 'About us',
                          onTap:(){

                            setState(() {
                              index=0;
                            });

                          }

                      ),
                      textButton(size: size,
                          isHover: index==1?true:isHover[1],
                          hoverFunction:(value)=>setState(() {
                            isHover[1]=value;
                          }),
                          text: 'Adaption',
                          onTap:(){

                            setState(() {
                              index=1;
                            });

                          }
                      ),
                      textButton(size: size,
                          isHover: index==2?true:isHover[2],
                          hoverFunction:(value)=>setState(() {
                            isHover[2]=value;
                          }),
                          text: 'Services',
                          onTap:(){

                            setState(() {
                              index=2;
                            });

                          }
                      ),
                      textButton(size: size,
                          isHover: index==3?true:isHover[3],
                          hoverFunction:(value)=>setState(() {
                            isHover[3]=value;
                          }),
                          text: 'Request',
                          onTap:(){

                            setState(() {
                              index=3;
                            });

                          }
                      ),
                      Spacer(),
                      InkWell(
                        onHover:(value)
                        {
                          if(value){
                            setState(() {
                              isHover[4]=true;
                            });}
                          else setState(() {
                            isHover[4]=false;
                          });
                          print(isHover);
                        } ,
                        onTap:(){

                          setState(() {
                            index=4;
                          });

                        },
                        child:isHover[4]||index==4? Container(
                          height: 120,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color:Colors.white),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Text('Sign up',style: TextStyle(
                                color: isHover[4]||index==4?Colors.black:Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        ):
                        Container(
                          height: 120,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color:Colors.white),
                          ),
                          child: Center(
                            child: Text('Sign up',style: TextStyle(
                                color: isHover[4]?Colors.black:Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width:size.width*.02,),
                      InkWell(
                        onHover:(value)
                        {
                          if(value){
                            setState(() {
                              isHover[5]=true;
                            });}
                          else {
                            setState(() {
                            isHover[5]=false;
                          });
                          }
                          print(isHover);
                        } ,
                        onTap: ()
                        {
                          setState(() {
                            index=5;
                          });
                          print(index);

                        },
                        child:isHover[5]||index==5? Container(
                          height: 120,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color:Colors.white),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Text('Login',style: TextStyle(
                                color: isHover[5]||index==5?Colors.black:Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        ):
                        Container(
                          height: 120,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color:Colors.white),
                          ),
                          child: Center(
                            child: Text('Login',style: TextStyle(
                                color: isHover[5]?Colors.black:Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ) ,
          ) ,
          body:SingleChildScrollView(
            child: Column(
              children: [
                HomeCubit.get(context).screens[index],
                Container(
                  decoration:  BoxDecoration(
                      gradient:LinearGradient(begin:Alignment.bottomRight ,
                          end:Alignment.topLeft ,
                          colors:
                          [
                            HexColor('#190801'),
                            HexColor('#432A20'),
                          ])
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(1.0),
                    child: Expanded(
                      child: Row(
                        children:
                        [
                          Column(
                            children: [
                              Padding(
                                padding:EdgeInsets.only(left:size.width*.05),
                                child: Stack(
                                  children:
                                  [
                                    Padding(
                                      padding:EdgeInsets.only(left:size.width*.19),
                                      child: Image(
                                        color: Colors.brown[200],
                                        image: AssetImage('assets/images/dogHand.png'),
                                        height:100 ,
                                        width:100,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('For any questions',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: HexColor('#FFE3C5')
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:20,top: 10),
                                child: Row(
                                  children:
                                  [
                                    Image(image: AssetImage('assets/images/email.png'),
                                      color:HexColor('#AE957B'),
                                      height:40 ,
                                      width: 40,
                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      emailController.text,
                                      style: TextStyle(color: HexColor('#AE957B'),
                                          fontSize:22 ,
                                          fontWeight:FontWeight.w600
                                      ),

                                    )

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:20.0,bottom: 20),
                                child: Row(
                                  children:
                                  [
                                    Icon(Icons.call,
                                      color:HexColor('#AE957B'),
                                      size: 50,
                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      phoneController.text,
                                      style: TextStyle(color: HexColor('#AE957B'),
                                          fontSize:22 ,
                                          fontWeight:FontWeight.w600
                                      ),

                                    ),
                                    SizedBox(width: 50,),


                                  ],
                                ),
                              ),




                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(top: 20,left:size.width*.05),
                                  child: Stack(
                                    children:
                                    [
                                      Padding(
                                        padding:EdgeInsets.only(left:size.width*.19),
                                        child: Image(
                                          color: Colors.brown[200],
                                          image: AssetImage('assets/images/dogHand.png'),
                                          height:100 ,
                                          width:100,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text('We are waiting you',style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: HexColor('#FFE3C5')
                                        ),),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:20,top: 10),
                                  child: Row(
                                    children:
                                    [
                                      Icon(Icons.location_pin,
                                        color:HexColor('#AE957B'),
                                        size: 50,
                                      ),
                                      SizedBox(width: 30,),
                                      Text(
                                        locationController.text,
                                        style: TextStyle(color: HexColor('#AE957B'),
                                            fontSize:22 ,
                                            fontWeight:FontWeight.w600
                                        ),

                                      ),
                                      SizedBox(width: 2,),


                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:20.0,bottom: 20),
                                  child: Row(
                                    children:
                                    [
                                      Icon(Icons.location_pin,
                                        color:HexColor('#AE957B'),
                                        size: 50,
                                      ),
                                      SizedBox(width: 30,),
                                      Text(
                                        location2Controller.text,
                                        style: TextStyle(color: HexColor('#AE957B'),
                                            fontSize:22 ,
                                            fontWeight:FontWeight.w600
                                        ),

                                      ),
                                      SizedBox(width:95,),


                                    ],
                                  ),
                                ),




                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 80.0),
                            child: Image(
                              image: AssetImage('assets/images/footerDog.png'),
                              height:400 ,
                              width:400,),
                          ),


                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),




        );
      },

    );
  }
}



