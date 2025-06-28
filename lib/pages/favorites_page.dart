import 'package:flutter/material.dart';
import 'package:fooddelivery/models/food_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
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
                Image.asset("assets/images/empty_state.png",fit: BoxFit.contain,
                height: isLandScape? size.height*0.8 : size.height*0.32,
                ),
                Text(
                  "No favorites food yet",
                  style: TextStyle(fontSize: isLandScape? size.height*0.06 : size.height*0.03, fontWeight: FontWeight.w500),
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
          (context, index) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      favoriteFoodFilter[index].imageUrl,
                      height: isLandScape? size.height*0.3 : size.height*0.1,
                      width: isLandScape? size.width*0.3 : size.width*0.3,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            favoriteFoodFilter[index].name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${favoriteFoodFilter[index].price}\$",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final targetedItem = favoriteFoodFilter[index];
                        int targetedIndex = food.indexOf(targetedItem);
                        setState(() {
                          food[targetedIndex] = food[targetedIndex].copyWith(
                            isFavorite: false,
                          );
                          favoriteFoodFilter.remove(targetedItem);
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                        size: isLandScape ? size.height*0.13 : size.height*0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
