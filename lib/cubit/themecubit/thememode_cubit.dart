import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../NewsServices/cachehelper.dart';

part 'thememode_state.dart';

class ThememodeCubit extends Cubit<ThememodeState> {
  ThememodeCubit() : super(ThememodeInitial());


  bool isdark= CacheHelper.getdata(key: 'isdark')?? false;

  void Thememode()async{
    emit(thememode());
    isdark = !isdark;
    await CacheHelper.putdata(key: 'isdark',  value: isdark);




  }


}
