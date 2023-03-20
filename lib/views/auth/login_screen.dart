import 'package:flutter/material.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/views/auth/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;

  // login checking func

  onLogin() async {
    if (_formKey.currentState!.validate()) {
      await AuthProvider.loginFunc(
          email: _emailController.text, password: _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Text(
            'Login',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('Welcome Back!'),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email can not be empty!';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'This is not a valid email!';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_rounded),
                      border: const OutlineInputBorder(),
                      labelText: 'Enter Your Email',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password can not be empty!';
                      }
                      if (value.length < 6) {
                        return 'Password should be at least 6 characters long!';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_person_rounded),
                      border: const OutlineInputBorder(),
                      labelText: 'Enter Your Password',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(
                          right: 15,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_rounded,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(
                        20,
                      ),
                    ),
                    onPressed: () {
                      onLogin();
                    },
                    icon: Icon(
                      Icons.login_rounded,
                    ),
                    label: Text('Log In'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not an user!'),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        ),
                        child: Text(
                          'Register Now!',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
