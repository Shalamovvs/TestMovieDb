import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/bloc/MainEvent.dart';
import 'package:moviedb/bloc/MainState.dart';
import 'package:moviedb/models/Answer.dart';
import 'package:moviedb/models/Movie.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    add(MainLoad());
  }

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    yield MainLoading();
    yield MainSuccess(movieList: await _loadRep());
  }
}

Future<List<Movie>> _loadRep() async {
  var dio = Dio();
  Response response = await dio.get('https://api.themoviedb.org/3/movie/popular?api_key=0bf6ed0f00b7a996073b056e940cbf0a&language=en-US');
  print('${response.data}');
  
  Answer answer = Answer.fromMap(response.data);

  return answer.result;
}
