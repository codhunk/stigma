import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:apnaparcelfinal/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stigma/features/authentication/screens/login/login_screen.dart';
import 'package:stigma/features/authentication/screens/signup/signup_screen.dart';
import 'package:stigma/features/authentication/screens/signup/verifyemail.dart';
import 'package:stigma/navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  // Firebase Storage
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;
  @override
  void onReady() {
    // Remove the splash screen after initialization
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void logIn(){
    
  }

  // Function to show Relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmail(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => SignUpScreen());
    }
  }

  /// [EmailAuthentication]-LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found for that email.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Wrong password provided for that user.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      rethrow;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication]-REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Error",
          "The password provided is too weak.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Error",
          "The account already exists for that email.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar(
          "Error",
          "The email address is badly formatted.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// [EmailAuthentication]-FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar(
          "Error",
          "The email address is badly formatted.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /*------------------------------Features identity & social sign-in--------------------------*/

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential> signinWithGoogle() async {
    try {
      //Triger the authentication flow
final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      //Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found for that email.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Wrong password provided for that user.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      rethrow;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /*------------------------------ ./end Features identity & social sign-in--------------------------*/

  // [EmailAuthentication]-LOGOUT
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found for that email.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Wrong password provided for that user.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  // [EmailAuthentication]-DELETE ACCOUNT
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        Get.snackbar(
          "Error",
          "Please reauthenticate to delete your account.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  // Upload Image to Firebase Storage
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    throw 'Failed to upload image and retrieve URL.';
  }
}
