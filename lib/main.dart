import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/shared/constants/constants.dart';
import 'package:petology/shared/network/local/cache_helper.dart';
import 'package:petology/shared/network/remote/dio_helper.dart';
import 'package:petology/view_models/home_cubit/homeViewModel.dart';
import 'package:petology/view_models/login_cubit/loginCubit.dart';
import 'package:petology/view_models/register_cubit/registerCubit.dart';
import 'package:petology/view_models/request_cubit/requestViewModelCubit.dart';
import 'package:petology/view_models/services_view_model/servicesViewModelCubit.dart';
import 'package:petology/views/home_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
   await CacheHelper.init();


  

  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeViewModelCubit()..changeScreen(index)),
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>RegisterCubit()..changeScreen(index)),
        BlocProvider(create: (context)=>RequestViewModelCubit()),
        BlocProvider(create: (context)=>ServicesViewModelCubit()),



      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Petology',
        home: ScreenTypeLayout(
            mobile: HomeView(),
          desktop:Builder(

            builder: (context) {
              return HomeView();
            },

          ) ,
          breakpoints: const ScreenBreakpoints(desktop:700,tablet: 400,watch: 100),

        ),
      ),
    );
  }
}

