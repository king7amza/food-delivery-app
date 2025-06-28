import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../widgets/food_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/classic_burger.jpg",
                  height: isLandScape ? size.height * 0.7 : size.height * 0.21,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.height * 0.014),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: food.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isLandScape? 4 : 2,
                    mainAxisSpacing: isLandScape? size.height * 0.07 : size.height * 0.02,
                    crossAxisSpacing: isLandScape? size.height * 0.07 : size.height * 0.02,
                  ),
                  itemBuilder: (context, index) => FoodGridItem(foodIndex: index,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
