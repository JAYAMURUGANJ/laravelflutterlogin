import 'package:flutter/material.dart';
import 'package:laravel_login/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = 'aziz@test.com';
    _passwordController.text = 'password';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _emailController,
                  validator: (value) =>
                      value!.isEmpty ? 'please enter valid email' : null),
              TextFormField(
                  controller: _passwordController,
                  validator: (value) =>
                      value!.isEmpty ? 'please enter password' : null),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Map creds = {
                    'email': _emailController.text,
                    'password': _passwordController.text,
                    'device_name': 'mobile',
                  };
                  if (_formKey.currentState!.validate()) {
                    Provider.of<Auth>(context, listen: false)
                        .login(creds: creds);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
