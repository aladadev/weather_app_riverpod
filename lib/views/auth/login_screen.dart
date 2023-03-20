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
        backgroundColor: Colors.white24,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Text(
            'Login',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black26, BlendMode.darken),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1487621167305-5d248087c724?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHdlYXRoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Welcome Back!',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                      ),
                      const SizedBox(
                        height: 40,
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
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: Colors.white,
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Enter Your Email',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: Colors.white),
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
                          prefixIcon: const Icon(
                            Icons.lock_person_rounded,
                            color: Colors.white,
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Enter Your Password',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: Colors.white),
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(
                            20,
                          ),
                        ),
                        onPressed: () {
                          onLogin();
                        },
                        icon: const Icon(
                          Icons.login_rounded,
                        ),
                        label: const Text('Log In'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not an user?',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen(),
                              ),
                            ),
                            child: Text(
                              'Register Now!',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
