import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FavoriteButton extends StatefulWidget {

  final int foodIndex;

  const FavoriteButton({super.key,required this.foodIndex});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(40),
        ),
        child: InkWell(
          onTap:
              () => setState(() {
            food[widget.foodIndex] =
                food[widget.foodIndex].copyWith(
                  isFavorite:
                  !food[widget.foodIndex].isFavorite,
                );
          }),
          child: Icon(
            food[widget.foodIndex].isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
