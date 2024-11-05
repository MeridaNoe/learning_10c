import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text('NM'),
              ),
              SizedBox(
                width: 8.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '20213tn121@utez.edu.mx',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Noe Merida Puennte',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Cerrar sesion')))
        ]),
      ),
    );
  }
}
