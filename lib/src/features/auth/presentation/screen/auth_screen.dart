import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:structure_opti_test_1/src/features/auth/presentation/provider/auth_provider.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  // global key for form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // text controller for email
  final TextEditingController _emailController = TextEditingController();
  // text controller for password
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // do something
                      bool? res = await context.read<AuthProvider>().SignIn(
                        {
                          'email': _emailController.text,
                          'password': _passwordController.text,
                        },
                      );
                      if (res == true) {
                        // navigate to home screen
                      } else {
                        // show error message
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
