import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            text: '19.99\$',
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
                launchCustomUr(context, bookModel.volumeInfo.previewLink!);
            },
            textColor: Colors.white,
            backgroundColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            text: getText(bookModel),
            fontSize: 16,
          ))
        ],
      ),
    );
  }
  
 String getText(BookModel bookModel) {
  if(bookModel.volumeInfo.previewLink==null){
    return 'Not Available';
  }else{
    return 'Preview';
  }
  }
}
