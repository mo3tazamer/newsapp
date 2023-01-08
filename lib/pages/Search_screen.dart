import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/newscubit_cubit.dart';

import '../models/NewsModel.dart';
import 'WebV.dart';

class Search extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                BlocProvider.of<NewscubitCubit>(context).getSearch(value);
              },
              decoration: const InputDecoration(
                  hintText: 'enter your Search ',
                  suffixIcon: Icon(Icons.search),
                  labelText: 'Search'),
            ),
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<NewscubitCubit, NewscubitState>(
              builder: (context, state) {
                List<Article>? news =
                    BlocProvider.of<NewscubitCubit>(context).Search;
                if (state is Searchcubitloading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is Searchcubitsucsess) {
                  return Expanded(
                    child: ListView.builder(

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
                                        url: news![i].url,
                                      ),
                                    ));
                              }
                            },
                            child: Card(
                              margin: const EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Column(
                                children: [
                                  news![i].urlToImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            '${news![i].urlToImage}',
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                        }),
                  );
                } else if (state is Searchcubitfailure) {
                  {
                    return Center(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
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
                  return const Center(child: Text('Search result'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
