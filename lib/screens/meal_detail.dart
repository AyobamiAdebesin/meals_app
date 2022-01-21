import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/meal_detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealtitle = routeArgs['title'];
    final imageurl = routeArgs['imageUrl'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: Card(
        
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.network(imageurl.toString())
            ),
            Text('$mealtitle')
          ],
        ),
      ),
    );
  }
}
