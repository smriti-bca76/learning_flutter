part of 'wishlist_bloc_bloc.dart';

@immutable
abstract class WishlistBlocEvent {}

class WishlistInitialEvent extends WishlistBlocEvent {}

class WishlistRemoveWishlistEvent extends WishlistBlocEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveWishlistEvent({required this.productDataModel});
}
