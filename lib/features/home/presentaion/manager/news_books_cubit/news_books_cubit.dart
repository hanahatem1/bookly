import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this.homeRepo) : super(NewsBooksInitial());
  final HomeRepo homeRepo;

Future<void> featchNewsBooks() async{
  emit(NewsBooksLoading());
 var result = await  homeRepo.fetchNewsetBooks();
  result.fold((failure) {
    emit(NewsBooksFailure(failure.errMessage));
  }, 
  (books){
    emit(NewsBooksSuccess(books));
  }
  );
  }
}
