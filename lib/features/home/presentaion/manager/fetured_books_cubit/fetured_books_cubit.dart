import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetured_books_state.dart';

class FeturedBooksCubit extends Cubit<FeturedBooksState> {
  FeturedBooksCubit(this.homeRepo) : super(FeturedBooksInitial());

final HomeRepo homeRepo;

Future<void> featchFeaturdBooks() async{
  emit(FeturedBooksLoading());
 var result = await  homeRepo.fetchFeaturedBooks();
  result.fold((failure) {
    emit(FeturedBooksFailure(failure.errMessage));
  }, 
  (books){
    emit(FeturedBooksSuccess(books));
  }
  );
  }
}
