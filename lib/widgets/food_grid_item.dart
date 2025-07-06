import 'package:flutter/material.dart';

import '../models/food_model.dart';
import 'favorite_button.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;

  const FoodGridItem({super.key, required this.foodIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
          builder:
              (context, constraints) => Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.network(
                          food[foodIndex].imageUrl,
                          height: constraints.maxHeight*0.53,
                          fit: BoxFit.fill,
                        ),
                      ),
                      FavoriteButton(foodIndex: foodIndex,),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    food[foodIndex].name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize:constraints.maxHeight*0.15,
                    ),
                  ),
                  // const SizedBox(height: 6),
                  Text(
                    "${food[foodIndex].price}\$",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: constraints.maxHeight*0.1,
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
