import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges().map((user) {
    ref.read(currentUserProvider.notifier).state = user;
    return user;
  });
});

final currentUserProvider = StateProvider<User?>((ref) => null);

class AuthProvider {
  static Future<User?> registrationFunc(
      {required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: "Registering",
      );
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      EasyLoading.showSuccess('Account Created!');
      return userCredential.user;
    } catch (e) {
      EasyLoading.showError(e.toString());
      return null;
    }
  }

  static Future<User?> loginFunc(
      {required String email, required String password}) async {
    try {
      EasyLoading.show(status: 'Loggin In....');
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      EasyLoading.showSuccess('Success!');
      return userCredential.user;
    } catch (e) {
      EasyLoading.showError(e.toString());
      return null;
    }
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
