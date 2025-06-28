import 'package:flutter/material.dart';

import '../models/food_model.dart';

class FoodGridItem extends StatefulWidget {
  final int foodIndex;

  const FoodGridItem({super.key, required this.foodIndex});

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
}

class _FoodGridItemState extends State<FoodGridItem> {
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
                          food[widget.foodIndex].imageUrl,
                          height: constraints.maxHeight*0.53,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    food[widget.foodIndex].name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize:constraints.maxHeight*0.15,
                    ),
                  ),
                  // const SizedBox(height: 6),
                  Text(
                    "${food[widget.foodIndex].price}\$",
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
