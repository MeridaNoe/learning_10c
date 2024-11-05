import 'package:flutter/material.dart';
import 'package:learning_10c/widgets/content_column.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            ContentColumn(
                title: 'Primer Columna', description: 'Primer párrafo'),
            ContentColumn(
                title: 'Segunda Columna', description: 'segundo párrafo'),
            ContentColumn(
                title: 'Tercer Columna', description: 'Tercer párrafo'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/top');
        },
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
