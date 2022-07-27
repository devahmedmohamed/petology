import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/shared/constants/constants.dart';
import 'package:petology/shared/network/local/cache_helper.dart';
import 'package:petology/view_models/home_cubit/home_view_model.dart';
import 'package:petology/view_models/login_cubit/login_cubit.dart';
import 'package:petology/view_models/register_cubit/cubit.dart';
import 'package:petology/view_models/request_cubit/request_view_model_cubit.dart';
import 'package:petology/views/home_view.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:desktop_window/desktop_window.dart';

import 'shared/network/remote/dio_helper.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
   await CacheHelper.init();
  if(Platform.isWindows)
    await DesktopWindow.setMinWindowSize(Size(1300.0,1200.0));

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


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ScreenTypeLayout(
            mobile: HomeView(),
          desktop:Builder(

            builder: (context) {
              return HomeView();
            },

          ) ,
          breakpoints: ScreenBreakpoints(desktop:700,tablet: 400,watch: 100),

        ),
      ),
    );
  }
}

