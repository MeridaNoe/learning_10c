import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text('Primer textaaaaaaaaaaaaaaaaaa')),
              SizedBox(
                width: 16.0,
              ),
              Expanded(child: Text('Primer textaaaaaaaaaaaaaaaaaa')),
              SizedBox(
                width: 16.0,
              ),
              Expanded(child: Align(alignment: Alignment.topLeft, child: Text('Primer textaaaaaaaaaaaaaaaaaa'))),
              SizedBox(
                width: 16.0,
              ),
              Expanded(child: Text('Primer textaaaaaaaaaaaaaaaaaa')),
              SizedBox(
                width: 16.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
