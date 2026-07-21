// import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String searchQuery}) async {
    if (searchQuery.isEmpty || searchQuery.trim().isEmpty) {
      emit(SearchBooksInitial());
    } else {
      emit(SearchBooksLoading());
      var result = await searchRepo.fetchSearchedBooks(
        searchQuery: searchQuery,
      );
      result.fold(
        (failure) {
          emit(SearchBooksError(failure.errorMessage));
        },
        (books) {
          emit(SearchBooksSuccess(books));
        },
      );
    }
  }
}
