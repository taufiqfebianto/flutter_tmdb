part of 'watchlist_bloc.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();
  
  @override
  List<Object> get props => [];
}

class WatchlistInitial extends WatchlistState {}
