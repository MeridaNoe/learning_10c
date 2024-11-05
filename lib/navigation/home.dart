import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_10c/modules/home/entities/restaurants.dart';
import 'package:learning_10c/widgets/home/detail_restaurant.dart';
import 'package:learning_10c/widgets/home/list_restaurant_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  List<Restaurants> restaurants = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    db.collection("restaurants").snapshots().listen((event) {
      final List<Restaurants> newRestaurants = [];
      for (var doc in event.docs) {
        final restaurant = Restaurants(
            doc.data()['name'],
            doc.data()['description'],
            List<String>.from(doc.data()['images']),
            doc.data()['rating'],
            doc.data()['count'],
            doc.data()['location'] ?? GeoPoint(0, 0));
        newRestaurants.add(restaurant);
      }
      if (mounted) {
        setState(() {
          restaurants = newRestaurants;
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio", style: TextStyle(color: Colors.white),),
        backgroundColor:Colors.purple[300],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/top'),
        },
        child: const Icon(Icons.chevron_right),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          return ListRestaurantData(
            restaurant: restaurants[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailRestaurant(restaurant: restaurants[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
