import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wendys_test/presentation/cubit/cart/cart_cubit.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  void _onCartLongPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cart cleared')),
    );
    BlocProvider.of<CartCubit>(context).clearCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return GestureDetector(
          onLongPress: () => _onCartLongPressed(context),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Badge(
              label: Text(state.items.length.toString()),
              isLabelVisible: state.items.isNotEmpty,
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        );
      },
    );
  }
}
