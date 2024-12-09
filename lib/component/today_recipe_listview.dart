import 'package:flutter/material.dart';
import 'package:social_food_app/models/explore_recipe.dart';

import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

class TodayRecipeListview extends StatelessWidget {
  const TodayRecipeListview({super.key, required this.recipes});
  
  final List<ExploreRecipe>recipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Recipes of the Day 🍳',
        style: Theme.of(context).textTheme.displayLarge,
        ),
        Container(
          height: 400,
          color: Colors.transparent,
          child: ListView.separated(
            itemCount: recipes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              final recipe = recipes[index];
              return buildCard(recipe);
              },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 16,
              );
            }),
        ),
      ],
    );
  }
  //Metodo para generar las Card(x)
  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == "card1") {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == CardTypes.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == CardTypes.card2) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This Card does not exist');
    }
  }
}
