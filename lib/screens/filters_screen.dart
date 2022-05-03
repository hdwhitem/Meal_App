import '/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _veganFree = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = (widget.currentFilters['gluten'])!;
    _veganFree = (widget.currentFilters['vegan'])!;
    _vegetarian = (widget.currentFilters['vegetarian'])!;
    _lactoseFree = (widget.currentFilters['lactose'])!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _veganFree,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilter);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              SwitchListTile(
                  title: const Text('Lactose-free'),
                  subtitle: const Text('Only include Lactose-free meals.'),
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              SwitchListTile(
                  title: const Text('Gluten-free'),
                  subtitle: const Text('Only include gluten-free meals.'),
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              SwitchListTile(
                  title: const Text('Vegetarian-free'),
                  subtitle: const Text('Only include vegetarian-free meals.'),
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              SwitchListTile(
                  title: const Text('Vegan-free'),
                  subtitle: const Text('Only include vegan-free meals.'),
                  value: _veganFree,
                  onChanged: (newValue) {
                    setState(() {
                      _veganFree = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
