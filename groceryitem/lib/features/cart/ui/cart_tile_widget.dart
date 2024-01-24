import 'package:flutter/material.dart';
import 'package:groceryitem/features/cart/ui/bloc/cart_bloc_bloc.dart';
import 'package:groceryitem/features/home/models/home_product_data_model.dart';
import 'package:groceryitem/features/home/ui/bloc/home_bloc.dart';

class CartTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBlocBloc cartBlocBloc;
  const CartTile(
      {super.key, required this.productDataModel, required this.cartBlocBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl)))),
        const SizedBox(
          height: 20,
        ),
        Text(
          productDataModel.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(productDataModel.description),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rs. ' + productDataModel.price,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishListButtonClickEvent(
                      //     clickedProduct: productDataModel));
                    },
                    icon: Icon(
                      Icons.favorite_border,
                    )),
                IconButton(
                    onPressed: () {
                      cartBlocBloc.add(CartRemoveFromCartEvent(
                          productDataModel: productDataModel));
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                    )),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
