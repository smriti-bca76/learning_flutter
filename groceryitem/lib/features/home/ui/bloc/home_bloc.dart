import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:groceryitem/data/cart_items.dart';
import 'package:groceryitem/data/grocery_item.dart';
import 'package:groceryitem/data/wishlist_item.dart';
import 'package:groceryitem/features/home/models/home_product_data_model.dart';
import 'package:groceryitem/features/home/ui/home.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickEvent>(
        homeProductWishListButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadingSuccess(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }
}

FutureOr<void> homeProductWishListButtonClickEvent(
    HomeProductWishListButtonClickEvent event, Emitter<HomeState> emit) {
  print('Wishlist Product clicked');
  wishListItems.add(event.clickedProduct);
  //passing data to block through event
  emit(HomeProductItemWishListedActionState());
}

FutureOr<void> homeProductCartButtonClickEvent(
    HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
  print('Cart Product clicked');
  cartItems.add(event.clickedProduct);
  emit(HomeProductItemCartedActionState());
}

FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
  print('Wishlist Navigate clicked');
  emit(HomeNavigateToWishListPageActionState());
}

FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
  print('Cart Navigate clicked');
  emit(HomeNavigateToCartPageActonsState());
}
