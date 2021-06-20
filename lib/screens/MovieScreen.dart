import 'package:flutter/material.dart';
import 'package:moviedb/bloc/MainBloc.dart';
import 'package:moviedb/bloc/MainState.dart';
import 'package:moviedb/listeners/MainListener.dart';
import 'package:moviedb/providers/MainProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/screens/DetailScreen.dart';

class MoviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MainProvider(
      child: MainListener(
        child: Scaffold(
          backgroundColor: Colors.blue[800],
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 50,left: 20,right: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Популярные фильмы', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                    BlocBuilder<MainBloc, MainState>(
                      builder: (context, state) {
                        if (state is MainSuccess)
                        {
                          return ListView.builder(
                            primary: false,
                            itemCount: state.movieList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(movie: state.movieList[index])));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            '${state.movieList[index].title}', 
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold, 
                                              fontSize: 16
                                            )
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        if (state is MainLoading)
                        {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        else
                        {
                          return Container();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}