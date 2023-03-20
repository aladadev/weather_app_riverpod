import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/profile_model.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/providers/profile_provider.dart';
import 'package:weather_app/views/auth/login_screen.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userNameController = TextEditingController();
  bool _showPassword = false;
  bool _confirmShowPassword = false;

  void onSignUp() async {
    if (_formKey.currentState!.validate()) {
      await AuthProvider.registrationFunc(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim())
          .then((value) async {
        if (value != null) {
          final ProfileModel profile = ProfileModel(
            id: value.uid,
            name: _userNameController.text.trim(),
            email: _emailController.text.trim(),
            registerTimme: DateTime.now(),
          );
          await ProfileProvider.addNewProfile(profile).then((value) {
            if (value) {
              ref.invalidate(profileFutureProvider);
              Navigator.pop(context);
            }
          });
        }
      });
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
            'Sign Up',
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
                  const Text('Let\'s create an account!'),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name can not be empty!';
                      }

                      return null;
                    },
                    controller: _userNameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_2_rounded,
                      ),
                      border: const OutlineInputBorder(),
                      labelText: 'Name',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
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
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password can not be empty!';
                      }
                      if (value.length < 6) {
                        return 'Password should be at least 6 characters long!';
                      }
                      if (value != _passwordController.text) {
                        return 'Password do not match';
                      }
                      return null;
                    },
                    controller: _confirmPasswordController,
                    obscureText: !_confirmShowPassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_person_rounded),
                      border: const OutlineInputBorder(),
                      labelText: 'Confirm Your Password',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(
                          right: 15,
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmShowPassword = !_confirmShowPassword;
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
                    onPressed: onSignUp,
                    icon: Icon(
                      Icons.sign_language_sharp,
                    ),
                    label: Text('Sign Up'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already an user!'),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Log In!',
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
