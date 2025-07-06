import 'package:flutter/material.dart';
import 'package:fooddelivery/models/food_model.dart';
import 'package:fooddelivery/widgets/favorite_button.dart';

class FoodDetailsPage extends StatelessWidget {
  final FoodModel foodModel;

  const FoodDetailsPage({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              child: SafeArea(
                child: SizedBox(
                  height: size.height*0.45,
                  width: size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.chevron_left),
                          FavoriteButton(foodIndex: 1),
                        ],
                      ),
                      Image.network(
                        foodModel.imageUrl,
                        fit: BoxFit.contain,
                        width: size.width,
                        height: size.height * 0.4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
