import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/NewsModel.dart';
import 'package:newsapp/pages/WebV.dart';
import '../cubit/newscubit_cubit.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewscubitCubit, NewscubitState>(
      builder: (context, state) {
        List<Article>? news = BlocProvider.of<NewscubitCubit>(context).data;
        if (state is Newscubitloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Newscubitsucsess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: news!.length,
              itemBuilder: (BuildContext context, int i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViews(
                            url: news[i].url,
                          ),
                        ));
                  },
                  child: Card(
                    margin: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      children: [
                        news[i].urlToImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '${news[i].urlToImage}',
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            : Image.asset(
                                'assets/Error.png',
                                fit: BoxFit.fitWidth,
                              ),
                        Text('${news[i].title}'),
                        const SizedBox(
                          height: 12,
                        ),
                        Text('${news[i].description}'),
                      ],
                    ),
                  ),
                );
              });
        } else if (state is Newscubitfailure) {
          {
            return Center(
                child: Column(
              children: [const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
///
                      child: Image.asset('assets/Nowifi.png')),
                ),
                const Text('Check your Connection '),
              ],
            ));
          }
        } else {
          return const Center(child: Text('No Data'));
        }
      },
    );
  }
}
