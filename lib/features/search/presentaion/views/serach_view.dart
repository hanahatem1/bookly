import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentaion/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentaion/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchView extends StatelessWidget {
 const  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
            body: BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SearchViewBody();
        }else if (state is SearchFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const LoadingIndicator();
        }
      }
            )
        );
      }
}
