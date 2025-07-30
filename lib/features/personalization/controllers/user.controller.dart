import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:stigma/common/widgets/loaders/loaders.dart';
import 'package:stigma/data/repositories.authentication/user/user_repository.dart';
import 'package:stigma/features/authentication/models/user_model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///Fetch the records
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save User Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //Refresh User records
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '',
          );

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            email: userCredentials.user!.email ?? '',
            fullName: nameParts[0],
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            password:
                '', // Replace with a valid string or fetch the password if available
            profilePicture: '',
          );
          final userRepository = UserRepository();
          await userRepository.saveUserRecords(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile',
      );
    }
  }

  Future<void> pickAndUploadPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      print('No image selected.');
      return;
    }

    File imageFile = File(pickedFile.path);

    // Cloudinary Configurations
    const cloudName = 'YOUR_CLOUD_NAME';
    const uploadPreset = 'YOUR_UPLOAD_PRESET';

    final uploadUrl = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final request =
        http.MultipartRequest('POST', uploadUrl)
          ..fields['upload_preset'] = uploadPreset
          ..files.add(
            await http.MultipartFile.fromPath('file', imageFile.path),
          );

    final response = await request.send();

    if (response.statusCode == 200) {
      final resStream = await response.stream.bytesToString();
      final resData = json.decode(resStream);

      final profileImageUrl = resData['secure_url'];
      print('Uploaded Image URL: $profileImageUrl');

      // After uploading, update the UI
      Get.snackbar(
        'Success',
        'Profile picture updated!',
        snackPosition: SnackPosition.BOTTOM,
      );

      // You can call setState() or update GetX variables if needed
    } else {
      Get.snackbar(
        'Error',
        'Failed to upload image!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
