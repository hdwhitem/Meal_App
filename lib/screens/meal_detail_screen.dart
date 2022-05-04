import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../dummy_data.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailScreen(
      {Key? key, required this.toggleFavorite, required this.isFavorite})
      : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  var _favorite = false;

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 260,
      width: 300,
      child: child,
    );
  }

  void _isfavorite() {
    setState(() {
      _favorite = !_favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    _favorite = widget.isFavorite(mealId) ? true : false;
    final selectdMeal = DUMMY_MEALS.firstWhere(
      (meal) => mealId == meal.id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectdMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(selectdMeal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectdMeal.ingredients[index])),
                ),
                itemCount: selectdMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectdMeal.steps[index],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectdMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        spacing: 10,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.delete),
            label: 'Delete',
            onTap: () {
              Navigator.of(context).pop(mealId);
            },
          ),
          SpeedDialChild(
            backgroundColor: widget.isFavorite(mealId) || _favorite
                ? Colors.redAccent
                : Colors.white,
            child: Icon(widget.isFavorite(mealId) || _favorite
                ? Icons.favorite
                : Icons.favorite_border),
            label: 'Favorite',
            onTap: () {
              widget.toggleFavorite(mealId);
              _isfavorite();
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.white,
            child: const Icon(Icons.keyboard_return),
            label: 'Categories',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
