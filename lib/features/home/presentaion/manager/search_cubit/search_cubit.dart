import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

final HomeRepo homeRepo;
  Future<void> searchBooks(String query) async{
  emit(SearchLoading());
 var result = await  homeRepo.searchBooks();
  result.fold((failure) {
    emit(SearchFailure(failure.errMessage));
  }, 
  (books){
    emit(SearchSuccess(books));
  }
  );
  }
}
