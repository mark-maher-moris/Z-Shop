import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_shop/core/consts.dart';
import 'package:z_shop/layout/cubit/shop_cubit.dart';
import 'package:z_shop/layout/shopLayout.dart';
import 'package:z_shop/modules/registration/loginScreen.dart';
import 'package:z_shop/shared/chach_helper.dart';
import 'package:z_shop/shared/dio_helper.dart';
import 'package:z_shop/modules/onBoarding/onBoardingScreen.dart';
import 'package:z_shop/shared/bloc_observer.dart';

Widget? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBool('isDark') ?? true;
  bool? onBording = CacheHelper.getBool('onBoarding') ?? true;
  token = CacheHelper.getBool('token');
  print(token);

  if (onBording != null || onBording == false) {
    if (token == null)
      initScreen = LoginScreen();
    else
      initScreen = ShopLayout();
  } else {
    initScreen = OnBoardingScreen();
  }

  runApp(MyApp(
    onbording: onBording,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.onbording});
  final bool? onbording;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ShopCubit()
                ..getHomeData()
                ..getCategories())
        ],
        child: MaterialApp(
            title: 'Api Shop',
            debugShowCheckedModeBanner: false,
            // theme: lightTheme,
            // darkTheme: darkTheme,
            home: ShopLayout()));
  }
}
/*
MultiBlocProvider (
  probiders:
  [
    BlocProvider()
  ],
  child : BlocConsumer<AppCubit, AppStates>(
    listener:(context ,state){},
    builder : ( context ,state ){
      return MaterialApp()
    }

  )
  )
*/

