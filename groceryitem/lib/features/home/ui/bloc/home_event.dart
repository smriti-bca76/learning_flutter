part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickEvent extends HomeEvent {
  final ProductDataModel clickedProduct; //passing data to block through event

  HomeProductWishListButtonClickEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickEvent extends HomeEvent {
  final ProductDataModel clickedProduct; //passing data to block through event

  HomeProductCartButtonClickEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
