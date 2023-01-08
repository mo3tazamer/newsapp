import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/NewsServices/NewsServices.dart';
import '../models/NewsModel.dart';
import '../pages/Science_screen.dart';
import '../pages/business_screen.dart';
import '../pages/sports_screen.dart';

part 'newscubit_state.dart';

class NewscubitCubit extends Cubit<NewscubitState> {
  NewscubitCubit() : super(NewscubitInitial());







  //##############################

  int indexvalue = 0;

  List pages = [
    Business(),
    Sports(),
    science(),
  ];
  void bootom(int index) {
    indexvalue = 0;
    emit(navigatbar());
    indexvalue = index;
    if (indexvalue == 0) {
      getdata();
    } else if(indexvalue == 1) {
      getsports();
    }else {
      getscience();
    }
  }

  List<BottomNavigationBarItem> BarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science')
  ];

//#####################################################
  NewsServices businessdata = NewsServices();
  List<Article>? data;
  List<Article>? sports;
  List<Article>? Science;
  List<Article>? Search;


  void getdata() async {
    emit(Newscubitloading());

    try {
      data = await businessdata.postData();
      emit(Newscubitsucsess());
    } catch (e) {
      emit(Newscubitfailure());
      print(e);
    }
  }

  void getsports() async {
    emit(sportscubitloading());
    try {
      sports = await businessdata.postsport();
      emit(sportscubitsucsess());
    } catch (e) {
      emit(sportscubitfailure());
      print(e);
    }
  }

  void getscience()  async {
    emit(sciencecubitloading());
    try {
  Science = await businessdata.postscience();
      emit(sciencecubitsucsess());
    } catch (e) {
      emit(sciencecubitfailure());
      print(e);
    }
  }


  void getSearch(var value)  async {
    emit(Searchcubitloading());
    try {
      Search = await businessdata.Search(value) ;
      emit(Searchcubitsucsess());
    } catch (e) {
      emit(Searchcubitfailure());
      print(e);
    }
  }
}
