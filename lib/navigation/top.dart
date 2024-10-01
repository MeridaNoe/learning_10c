import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  final List<Map<String, String>> topDishes = [
    {
      'name': 'Tacos',
      'description': 'Deliciosos tacos de carne asada con guacamole.'
    },
    {
      'name': 'Sushi',
      'description': 'Rollo de sushi con pescado fresco y arroz.'
    },
    {'name': 'Pizza', 'description': 'Pizza napolitana con queso mozzarella.'},
    {
      'name': 'Pasta',
      'description': 'Pasta a la boloñesa con salsa de tomate.'
    },
    {
      'name': 'Hamburguesa',
      'description': 'Hamburguesa con queso, tocino y papas fritas.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 5 Platillos'),
      ),
      body: ListView.builder(
        itemCount: topDishes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.fastfood),
              title: Text(topDishes[index]['name']!),
              subtitle: Text(topDishes[index]['description']!),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/reservations');
        },
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.bookmark),
      ),
    );
  }
}
