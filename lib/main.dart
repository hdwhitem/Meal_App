import 'package:flutter/material.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/bottom_tabBar_screen.dart';
import '/screens/filters_screen.dart';
import '/dummy_data.dart';
import '/models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'])! && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'])! && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'])! && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'])! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeal',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.pink,
            secondary: Colors.amber, //accent color
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                // titleLarge: const TextStyle(
                //   fontSize: 24,
                //   fontFamily: 'RobotoCondensed',
                // ),
              ),
        ),
        //home: CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(),
          CategoryMealScreen.routeName: (context) => CategoryMealScreen(
                availableMeals: _availableMeals,
              ),
          MealDetailScreen.routeName: (context) => MealDetailScreen(),
          FiltersScreen.routeName: (context) => FiltersScreen(
                saveFilters: _setFilters,
                currentFilters: _filters,
              ),
        });
  }
}
