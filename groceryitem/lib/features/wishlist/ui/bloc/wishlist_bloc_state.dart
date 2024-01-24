part of 'wishlist_bloc_bloc.dart';

@immutable
abstract class WishlistBlocState {}

abstract class WishListActionState extends WishlistBlocState {}

class WishlistRemovedActionState extends WishListActionState {}

class WishlistBlocInitial extends WishlistBlocState {}

class WishListSuccessState extends WishlistBlocState {
  final List<ProductDataModel> wishListItems;
  WishListSuccessState({
    required this.wishListItems,
  });
}
