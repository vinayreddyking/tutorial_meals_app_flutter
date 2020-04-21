import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function saveFilter;
  FiltersScreen(this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenfree = false;
  bool _isVegitarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subTitle, bool value, Function onChangedFunction) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: onChangedFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenfree,
                'lactose': _isLactoseFree,
                'vegitarian': _isVegitarian,
                'vegan': _isVegan,
              };
              widget.saveFilter(selectedFilters);
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten Free',
                  'Only Include Gluten Free',
                  _isGlutenfree,
                  (newValue) {
                    setState(() {
                      _isGlutenfree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose Free',
                  'Only Include Lactose Free',
                  _isLactoseFree,
                  (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegitarian',
                  'Only Include Vegitarian',
                  _isVegitarian,
                  (newValue) {
                    setState(() {
                      _isVegitarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only Include Vegan',
                  _isVegan,
                  (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
