import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:groceryitem/data/wishlist_item.dart';
import 'package:groceryitem/features/home/models/home_product_data_model.dart';
import 'package:groceryitem/features/home/ui/bloc/home_bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveWishlistEvent>(wishlistRemoveWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistBlocState> emit) {
    emit(WishListSuccessState(wishListItems: wishListItems));
  }

  FutureOr<void> wishlistRemoveWishlistEvent(
      WishlistRemoveWishlistEvent event, Emitter<WishlistBlocState> emit) {}
}
