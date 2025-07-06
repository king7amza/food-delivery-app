import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/models/food_model.dart';

import 'food_details_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Widget adaptiveResponsiveFavButton({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    final size = MediaQuery.sizeOf(context);
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (Platform.isAndroid) {
      return isLandScape
          ? TextButton.icon(
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
              size: size.height * 0.13,
            ),
            onPressed: onPressed,
            label: Text(
              "Favorite",
              style: TextStyle(
                fontSize: size.height * 0.07,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
          : IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
              size: size.height * 0.04,
            ),
          );
    } else if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        child:
            isLandScape
                ? Row(
                  children: [
                    Icon(
                      CupertinoIcons.heart_fill,
                      color: Theme.of(context).primaryColor,
                      size: size.height * 0.13,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Favorite",
                      style: TextStyle(
                        fontSize: size.height * 0.07,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
                : Icon(
                  Icons.favorite,
                  color: Theme.of(context).primaryColor,
                  size: size.height * 0.04,
                ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget buildAdaptiveResponsiveFavButton({
    required List<FoodModel> favoriteFoodFilter,
    required int index,
  }) {
    return adaptiveResponsiveFavButton(
      context: context,
      onPressed: () {
        final targetedItem = favoriteFoodFilter[index];
        int targetedIndex = food.indexOf(targetedItem);
        setState(() {
          food[targetedIndex] = food[targetedIndex].copyWith(isFavorite: false);
          favoriteFoodFilter.remove(targetedItem);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteFoodFilter =
        food.where((foodItem) => foodItem.isFavorite == true).toList();

    if (favoriteFoodFilter.isEmpty == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/empty_state.png",
                  fit: BoxFit.contain,
                  height: isLandScape ? size.height * 0.8 : size.height * 0.32,
                ),
                Text(
                  "No favorites food yet",
                  style: TextStyle(
                    fontSize:
                        isLandScape ? size.height * 0.06 : size.height * 0.03,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return ListView.builder(
      itemCount: favoriteFoodFilter.length,
      itemBuilder:
          (context, index) => InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FoodDetailsPage(foodModel: favoriteFoodFilter[index],);
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        favoriteFoodFilter[index].imageUrl,
                        height:
                            isLandScape ? size.height * 0.32 : size.height * 0.1,
                        width: isLandScape ? size.width * 0.32 : size.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favoriteFoodFilter[index].name,
                              style: TextStyle(
                                fontSize:
                                    isLandScape
                                        ? size.height * 0.08
                                        : size.height * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${favoriteFoodFilter[index].price}\$",
                              style: TextStyle(
                                fontSize:
                                    isLandScape
                                        ? size.height * 0.08
                                        : size.height * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      buildAdaptiveResponsiveFavButton(
                        favoriteFoodFilter: favoriteFoodFilter,
                        index: index,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
