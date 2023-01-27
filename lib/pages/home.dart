import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){},icon: Icon(Icons.search),)],
        title: Text('Weather App'),
        ),
        body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const Text(
              'searchiiiiing now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
    ),
    );
  }
}