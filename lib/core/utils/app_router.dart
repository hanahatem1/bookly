import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentaion/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/home/presentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/home/presentaion/views/home_view_details.dart';
import 'package:bookly_app/features/search/presentaion/views/serach_view.dart';
import 'package:bookly_app/features/splash/presentaion/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BooksDetailsView';
  static const kBookSearchView = '/BookSearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: HomeViewDetails(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kBookSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt.get<HomeRepoImpl>()),
          child:  SearchView(
            
          ),
        ),
      ),
    ],
  );
}
