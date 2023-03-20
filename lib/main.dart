import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/views/auth/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/views/navbar/wrapper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        dialogTheme:
            DialogTheme(titleTextStyle: Theme.of(context).textTheme.labelLarge),
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            toolbarTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      title: 'Weather App',
      home: const LandingPage(),
      builder: EasyLoading.init(),
    );
  }
}

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateRef = ref.watch(authStateProvider);
    return Scaffold(
      body: authStateRef.when(
        data: (data) {
          return data == null ? const LoginScreen() : const WrapperScreen();
        },
        error: (error, stackTrace) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
