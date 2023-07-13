import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier()
      : super([]); // in the beginning, the favorites list is empty.

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite =
        state.contains(meal); // check if a meal is in the favorites list or not

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList(); // remove a meal.
      return false;
    } else {
      state = [
        ...state,
        meal
      ]; // add a meal by pulling out the existing favorite meals using spread operator and then adding the current meal to the favorites list
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
