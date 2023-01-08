import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/themecubit/thememode_cubit.dart';
import 'package:newsapp/pages/Search_screen.dart';
import '../cubit/newscubit_cubit.dart';

class BottomBarNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewscubitCubit, NewscubitState>(
      builder: (context, state) {
        var navbar = BlocProvider.of<NewscubitCubit>(context);
        return Scaffold(

          appBar: AppBar(
            title:  Text('News',style: Theme.of(context).textTheme.bodyText2,),

            actions: [
              IconButton(color:IconTheme.of(context).color,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {

                    BlocProvider.of<ThememodeCubit>(context).Thememode();
                  },
                  icon: const Icon(Icons.brightness_4_rounded),color:IconTheme.of(context).color)
            ],
          ),
          body: navbar.pages[navbar.indexvalue],
          bottomNavigationBar: BottomNavigationBar(

            iconSize: 30,

            currentIndex: navbar.indexvalue,
            onTap: (index) {
              navbar.bootom(index);
            },
            items: navbar.BarItems,
          ),
        );
      },
    );
  }
}
