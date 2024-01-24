part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadingSuccess extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccess({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActonsState extends HomeActionState {}

class HomeProductItemWishListedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
