import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:learning_10c/modules/home/entities/restaurants.dart';

class ListRestaurantData extends StatelessWidget {
  const ListRestaurantData({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  final Restaurants restaurant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            restaurant.images.isNotEmpty
                ? restaurant.images[0]
                : 'https://via.placeholder.com/50x50.png',
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 140,
                child: Text(
                  restaurant.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0, color: Colors.black54),
                ),
              )
            ],
          ),
          const Spacer(),
          StarRating(
            size: 16.0,
             rating: restaurant.count > 0
                ? restaurant.rating / restaurant.count
                : 0,
            color: Colors.orange,
            borderColor: Colors.grey,
            starCount: 5,
          ),
        ],
      ),
    );
  }
}
