import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/book_datails_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewDetails extends StatefulWidget {
  const HomeViewDetails({super.key, required this.bookModel});

final BookModel bookModel;
  @override
  State<HomeViewDetails> createState() => _HomeViewDetailsState();
}

class _HomeViewDetailsState extends State<HomeViewDetails> {

void initState(){
  BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
    category: widget.bookModel.volumeInfo.categories![0]
  );
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDetailsViewBody(
      bookModel: widget.bookModel,
    ));
  }
}
