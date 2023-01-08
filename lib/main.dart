import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/NewsServices/cachehelper.dart';
import 'package:newsapp/pages/Bottombarnav.dart';
import 'package:newsapp/pages/business_screen.dart';
import 'package:newsapp/pages/sports_screen.dart';

import 'NewsServices/NewsServices.dart';
import 'bloc_observer.dart';
import 'cubit/newscubit_cubit.dart';
import 'cubit/themecubit/thememode_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

 await CacheHelper.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => NewscubitCubit()..getdata()),
      BlocProvider(create: (context) => ThememodeCubit()),
    ],
    child:const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThememodeCubit, ThememodeState>(
      builder: (context, state) {
        return MaterialApp(
          themeMode: BlocProvider.of<ThememodeCubit>(context).isdark
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                backgroundColor: Colors.white,
                elevation: 15,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.blueGrey,
                backgroundColor: Colors.white,
                elevation: 15,
              ),
              scaffoldBackgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black, size: 28),
              buttonTheme: const ButtonThemeData(
                buttonColor: Colors.black,
              ),
              cardTheme: const CardTheme(
                color: Colors.white,
                elevation: 8,
                shadowColor: Colors.blueGrey,
              ),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(color: Colors.black, fontSize: 18),
                  bodyText2: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ))),
          darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.grey,
                    statusBarIconBrightness: Brightness.light),
                backgroundColor: Colors.grey,
                elevation: 15,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.white54,
                backgroundColor: Colors.grey,
                elevation: 15,
              ),
              scaffoldBackgroundColor: Colors.grey,
              iconTheme: const IconThemeData(color: Colors.white, size: 28),
              buttonTheme: const ButtonThemeData(
                buttonColor: Colors.white,
              ),
              cardTheme: const CardTheme(
                color: Colors.grey,
                elevation: 8,
                shadowColor: Colors.blueGrey,
              ),
              primarySwatch: Colors.teal,
              navigationBarTheme:
                  NavigationBarThemeData(indicatorColor: Colors.white),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(color: Colors.white, fontSize: 18),
                  bodyText2: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ))),
          debugShowCheckedModeBanner: false,
          home: BottomBarNav(),
        );
      },
    );
  }
}
