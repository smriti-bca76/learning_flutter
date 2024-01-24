import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryitem/features/cart/ui/cart.dart';
import 'package:groceryitem/features/home/ui/bloc/home_bloc.dart';
import 'package:groceryitem/features/home/ui/product_widget.dart';

import 'package:groceryitem/features/wishlist/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActonsState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item  carted')));
        } else if (state is HomeProductItemWishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item  wishlited')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoading:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadingSuccess:
            final successState = state as HomeLoadingSuccess;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  "Fresh Fruits ",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      )),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                        homeBloc: homeBloc,
                        productDataModel: successState.products[index]);
                  }),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
