import 'package:equatable/equatable.dart';
import 'package:moviedb/models/Movie.dart';

abstract class MainState extends Equatable{
  MainState();

	@override
	List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainFailure extends MainState {
  final String title;
  final String text;

  MainFailure({required this.title,required this.text});

  @override
	List<Object> get props => [title, text];
}

class MainSuccess extends MainState{
  final List<Movie> movieList;

  MainSuccess({required this.movieList});

  @override
	List<Object> get props => [movieList];
}