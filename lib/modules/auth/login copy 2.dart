import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.person),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Noe Merida Puente',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  Text(
                    'Hace 10 minutos',
                    style: TextStyle(color: Colors.black54, fontSize: 11.0),
                  ),
                ],
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.more_vert)))
            ],
          ),
          Image.asset(
            'assets/portada.png',
            width: double.infinity,
            height: 400,
          ),
          const Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Icon(Icons.message),
              Icon(Icons.send),
              Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.save)))
            ],
          )
        ],
      ),
    );
  }
}
