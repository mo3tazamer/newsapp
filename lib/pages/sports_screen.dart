import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newsapp/models/NewsModel.dart';

import '../cubit/newscubit_cubit.dart';
import 'WebV.dart';

class Sports extends StatelessWidget {
  const Sports({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewscubitCubit, NewscubitState>(
      builder: (context, state) {
        List<Article>? news = BlocProvider.of<NewscubitCubit>(context).sports;
        if (state is sportscubitloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is sportscubitsucsess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: news!.length,
              itemBuilder: (BuildContext context, int i) {
                return InkWell(
                  onTap: () {
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViews(
                              url: news[i].url,
                            ),
                          ));
                    }
                    ;
                  },
                  child: Card(
                    margin: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
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
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/Error.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                        Text('${news![i].title}'),
                        Text('${news![i].description}'),
                      ],
                    ),
                  ),
                );
              });
        } else if (state is sportscubitfailure) {
          {
            return Center(
                child: Column(
                  children: [const SizedBox(height: 45,),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: Image.asset('assets/Nowifi.png')),
                    ),
                    const Text('Check your Connection '),
                  ],
                ));
          }
        } else {
          return Center(child: const Text('no data'));
        }
      },
    );
  }
}
