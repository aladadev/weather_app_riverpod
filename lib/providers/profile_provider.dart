import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/firebase_constants.dart';
import 'package:weather_app/models/profile_model.dart';
import 'package:weather_app/providers/auth_provider.dart';

/// Getting Current User Profile Data so that we can use it to show on the widget
final profileFutureProvider = FutureProvider<ProfileModel?>((ref) {
  final firebaseCollectionPath =
      FirebaseFirestore.instance.collection(FirebaseConstants.userProfile);
  final currentUser = ref.read(currentUserProvider);
  if (currentUser != null) {
    return firebaseCollectionPath
        .where("id", isEqualTo: currentUser.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return ProfileModel.fromMap(value.docs.first.data());
      } else {
        return null;
      }
    });
  } else {
    return null;
  }
});

// This class will provide the method for add profile data and updating profile data to database
class ProfileProvider {
  static Future<bool> addNewProfile(ProfileModel profile) async {
    final firebaseCollectionPath =
        FirebaseFirestore.instance.collection(FirebaseConstants.userProfile);

    try {
      EasyLoading.show(status: 'Saving Profile');
      await firebaseCollectionPath.doc(profile.id).set(profile.toMap());
      EasyLoading.dismiss();
      return true;
    } catch (e) {
      print(e);
      EasyLoading.showError('Something went wrong!');
      return false;
    }
  }

  static Future<bool> updateProfile(ProfileModel profile) async {
    final firebaseCollectionPath =
        FirebaseFirestore.instance.collection(FirebaseConstants.userProfile);
    try {
      await firebaseCollectionPath.doc(profile.id).update(profile.toMap());
      return true;
    } catch (e) {
      EasyLoading.showError('Error Saving Profile');
      return false;
    }
  }
}
