import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:learning_10c/modules/home/entities/restaurants.dart';

class DetailRestaurant extends StatelessWidget {
  final Restaurants restaurant;

  const DetailRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
              ),
              items: restaurant.images.isNotEmpty
                  ? restaurant.images.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList()
                  : [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://via.placeholder.com/150x150.png',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      )
                    ],
            ),
            const SizedBox(height: 16),
            Text(
              restaurant.description,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            StarRating(
              size: 16.0,
              rating: restaurant.count > 0
                  ? restaurant.rating / restaurant.count
                  : 0,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: 5,
            ),
            const SizedBox(height: 16),
            Container(
              height: 250,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(restaurant.location.latitude,
                        restaurant.location.longitude),
                    zoom: 15),
                markers: {
                  Marker(
                      markerId: MarkerId('restaurant'),
                      position: LatLng(restaurant.location.latitude,
                          restaurant.location.longitude),
                      infoWindow: InfoWindow(title: restaurant.name)),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
