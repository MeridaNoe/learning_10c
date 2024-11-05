import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_10c/kernel/widgets/text_form_field_password.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuanta'),
        backgroundColor: Color.fromARGB(255, 128, 0, 255),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/food.png', width: 200, height: 200),
                const SizedBox(height: 16),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Correo electronico',
                          label: Text('Correo electronico'),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                      ),
                      TextFieldPassword(controller: _password),
                      SizedBox(height: 16),
                      TextFieldPassword(
                        controller: _confirmPassword,
                        hintText: 'Confirmar contraseña',
                        labelText: 'Confirmar contraseña',
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                              onPressed: () async {
                                // validar el formulario
                                if (!_formkey.currentState!.validate()) {
                                  return;
                                }
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: _email.text,
                                          password: _password.text);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                }
                              },
                              // quiero el background del boton de color morado
                              child: Text('Crear cuenta'))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
