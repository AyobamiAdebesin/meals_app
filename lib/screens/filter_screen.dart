import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final saveFilters;
  final Map<String, bool> currentFilters;

  const FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      {required String title,
      required String description,
      required bool currentValue,
      required updateValue}) {
    return SwitchListTile(
      activeColor: Colors.red,
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.save),
        //     onPressed: () {
        //       final selectedFilters = {
        //         'gluten': false,
        //         'lactose': false,
        //         'vegan': false,
        //         'vegetarian': false
        //       };
        //       widget.saveFilters(selectedFilters);
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal settings',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  title: 'Gluten-free',
                  description: 'Only include gluten-free meals',
                  currentValue: _glutenFree,
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Lactose-free',
                  description: 'Only include lactose -free meals',
                  currentValue: _lactoseFree,
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  description: 'Only include vegetarian meals',
                  currentValue: _vegetarian,
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegan',
                  description: 'Only include vegan meals',
                  currentValue: _vegan,
                  updateValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      final selectedFilters = {
                        'gluten': false,
                        'lactose': false,
                        'vegan': false,
                        'vegetarian': false
                      };
                      widget.saveFilters(selectedFilters);
                    },
                    icon: Icon(Icons.save),
                    label: Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
