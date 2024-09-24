// lib/providers/recipe_provider.dart

import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeProvider with ChangeNotifier {
  final List<Recipe> _recipes = [
    // New Telugu Recipes
    Recipe(
      id: '1',
      name: 'Pesarattu',
      ingredients: [
        '1 cup green gram (moong dal)',
        '2 green chilies',
        '1 small piece of ginger',
        '1/4 tsp cumin seeds',
        'Salt to taste',
        'Oil for cooking',
      ],
      instructions:
          '1. Soak green gram for 4 hours and grind with chilies, ginger, and cumin seeds to form a batter.\n'
          '2. Add salt and mix well.\n'
          '3. Heat a pan, spread the batter like a dosa, and drizzle oil around the edges.\n'
          '4. Cook until crisp and serve with chutney.',
    ),
    Recipe(
      id: '2',
      name: 'Gongura Pachadi',
      ingredients: [
        '1 bunch gongura leaves (sorrel leaves)',
        '2-3 green chilies',
        '1 tsp mustard seeds',
        '1 tsp cumin seeds',
        '1 tsp oil',
        'Salt to taste',
      ],
      instructions:
          '1. Heat oil in a pan and sauté the gongura leaves until they wilt.\n'
          '2. Grind the sautéed leaves with green chilies, mustard, and cumin seeds to make a paste.\n'
          '3. Season with salt and serve with rice.',
    ),
    Recipe(
      id: '3',
      name: 'Pulihora (Tamarind Rice)',
      ingredients: [
        '1 cup rice',
        '2 tbsp tamarind paste',
        '1 tsp mustard seeds',
        '1 tsp urad dal',
        '2 dried red chilies',
        'A pinch of asafoetida (hing)',
        '1 tbsp peanuts',
        'Curry leaves',
        'Salt to taste',
        'Oil for tempering',
      ],
      instructions:
          '1. Cook the rice and let it cool.\n'
          '2. Heat oil in a pan and temper mustard seeds, urad dal, red chilies, asafoetida, and peanuts.\n'
          '3. Add curry leaves and tamarind paste, cook for a few minutes.\n'
          '4. Mix the tamarind mixture with the rice and serve.',
    ),
    Recipe(
      id: '4',
      name: 'Gutti Vankaya (Stuffed Brinjal)',
      ingredients: [
        '8 small brinjals (eggplants)',
        '2 tbsp roasted peanuts',
        '1 tbsp sesame seeds',
        '1 tsp cumin seeds',
        '2 tbsp grated coconut',
        '1 tsp red chili powder',
        '1/2 tsp turmeric powder',
        'Salt to taste',
        'Oil for cooking',
      ],
      instructions:
          '1. Make a paste with roasted peanuts, sesame seeds, cumin seeds, coconut, red chili powder, and salt.\n'
          '2. Slit the brinjals and stuff them with the paste.\n'
          '3. Heat oil in a pan and cook the stuffed brinjals until tender.\n'
          '4. Serve hot with rice or roti.',
    ),
    Recipe(
      id: '5',
      name: 'Bobbatlu (Sweet Flatbread)',
      ingredients: [
        '1 cup chana dal',
        '1 cup jaggery',
        '1 tsp cardamom powder',
        '2 cups all-purpose flour',
        'Ghee for cooking',
      ],
      instructions:
          '1. Cook chana dal until soft, then mash it and mix with jaggery and cardamom powder.\n'
          '2. Prepare dough with flour and water.\n'
          '3. Roll out small balls of dough and fill them with the dal mixture.\n'
          '4. Roll them flat and cook on a hot griddle with ghee until golden brown.\n'
          '5. Serve warm.',
    ),
  ];

  List<Recipe> get recipes => [..._recipes];

  List<Recipe> get favoriteRecipes =>
      _recipes.where((recipe) => recipe.isFavorite).toList();

  Recipe findById(String id) {
    return _recipes.firstWhere((recipe) => recipe.id == id);
  }

  void toggleFavoriteStatus(String id) {
    final recipe = findById(id);
    recipe.isFavorite = !recipe.isFavorite;
    notifyListeners();
  }
}
