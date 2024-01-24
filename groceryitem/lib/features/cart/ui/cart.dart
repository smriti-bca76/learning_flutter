import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryitem/features/cart/ui/bloc/cart_bloc_bloc.dart';
import 'package:groceryitem/features/cart/ui/cart_tile_widget.dart';
import 'package:groceryitem/features/home/ui/product_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBlocBloc = CartBlocBloc();
  @override
  void initState() {
    cartBlocBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBlocBloc,
        listener: (context, state) {
          if (state is CartRemovedActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Cartlist is removed')));
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successsState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successsState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                        cartBlocBloc: cartBlocBloc,
                        productDataModel: successsState.cartItems[index]);
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
