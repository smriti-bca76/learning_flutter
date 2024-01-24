import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryitem/features/cart/ui/bloc/cart_bloc_bloc.dart';
import 'package:groceryitem/features/cart/ui/cart_tile_widget.dart';
import 'package:groceryitem/features/home/ui/product_widget.dart';
import 'package:groceryitem/features/wishlist/ui/bloc/wishlist_bloc_bloc.dart';
import 'package:groceryitem/features/wishlist/wishlist_tile.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBlocBloc wishlistBlocBloc = WishlistBlocBloc();
  @override
  void initState() {
    wishlistBlocBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
        bloc: wishlistBlocBloc,
        listener: (context, state) {
          if (state is WishlistRemovedActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Wishlist is removed')));
          }
        },
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is! WishListActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccessState:
              final successsState = state as WishListSuccessState;
              return ListView.builder(
                  itemCount: successsState.wishListItems.length,
                  itemBuilder: (context, index) {
                    return WishListTile(
                        wishlistBlocBloc: wishlistBlocBloc,
                        productDataModel: successsState.wishListItems[index]);
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
