import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  const SizedBox(height: 14),
                  const CustomBookDetailsAppBar(),
                  const SizedBox(height: 14),
                  BookDetailsSection(
                    book: bookModel,
                  ),
                  Expanded(
                  // ignore: prefer_const_constructors
                  child:  SizedBox(height: 50),
                ),
                  const SimilarBooksSection(),
                  const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
