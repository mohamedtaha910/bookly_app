part of 'favourite_cubit.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteSuccess extends FavouriteState {
  final List<BookModel> books;

  const FavouriteSuccess({required this.books});
}

final class FavouriteFail extends FavouriteState {}
