import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' show FirebaseStorage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//
import 'package:stigma/data/repositories.authentication/authentication_repository.dart';
import 'package:stigma/features/authentication/models/user_model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get to => Get.find();

  // Firebase Storage
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserRecords(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  /// Function to fetch user details based on user ID

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot =
          await _db
              .collection('Users')
              .doc(AuthenticationRepository.instance.authUser?.uid)
              .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception("Failed to fetch user details: ${e.message}");
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      throw Exception("Failed to fetch user details: $e");
    }
  }

  /// Function to Update user details based on user ID

  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception("Failed to update user details: ${e.message}");
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      throw Exception("Failed to update user details: $e");
    }
  }

  ///  update any field in specific User Collections

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception("Failed to update user details: ${e.message}");
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      throw Exception("Failed to update user details: $e");
    }
  }

  /// Function to remove user data from on firebase

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception("Failed to delete user data: ${e.message}");
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      throw Exception("Failed to delete user data: $e");
    }
  }

  //Upload Image to Firebase Storage
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(path);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      throw Exception("Failed to upload image: $e");
    }
  }
}
