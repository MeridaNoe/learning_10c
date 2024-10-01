import 'package:flutter/material.dart';

class Reservations extends StatelessWidget {
const Reservations({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservaciones'),
      ),
      body: const Center(
        child: Text(
          'Reservaciones',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/profile');
        }, 
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.person),
      ),
    );
  }
}