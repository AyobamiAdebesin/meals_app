import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void initState(){
     _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorites'},
  ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: Container(
        height: 50,
        child: BottomNavigationBar(
          enableFeedback: true,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          iconSize: 20,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}









// How to create a tabbar at the top of the app

// return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(toolbarHeight: 100,
//           title: Text('Meals', style: TextStyle(fontSize: 25),),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );