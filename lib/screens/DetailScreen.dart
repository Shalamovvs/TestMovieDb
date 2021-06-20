import 'package:flutter/material.dart';
import 'package:moviedb/models/Movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  DetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 400),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.network('https://image.tmdb.org/t/p/w500${movie.poster}', fit: BoxFit.fill),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text('${movie.title}',textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                            child: Text('Rating: ${movie.rating}', style: TextStyle(fontSize: 16, color: Colors.yellow[600])),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                            child: Text('Popularity: ${movie.popularity}', style: TextStyle(fontSize: 16, color: Colors.orange)),
                          )
                        ],
                      ),
                      Text('Release Date: ${movie.releaseDate}', style: TextStyle(fontSize: 16, color: Colors.lime))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text('${movie.overview}',textAlign: TextAlign.center ,style: TextStyle(fontSize: 14, color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
