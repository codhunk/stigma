import 'package:cloud_firestore/cloud_firestore.dart';

/// Moddel Class Representing user data
class UserModel {
  final String id;
  final String email;
  String fullName;
  String phoneNumber;
  String password;
  late String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.password,
    required this.profilePicture,
  });

  /// Helper Function to get the Phone Number

  String get formattedPhoneNumber {
    return phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Static function to split name into first name and last name

  static List<String> nameParts(String fullName) {
    return fullName.split(' ');
  }

  /// Static function to to generate a username first name and last name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUserName = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUserName";
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model
  static UserModel empty() {
    return UserModel(
      id: '',
      email: '',
      fullName: '',
      phoneNumber: '',
      password: '',
      profilePicture: '',
    );
  }

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'FullName': fullName,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data['Email'] ?? '',
        fullName: data['FullName'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        password: data['Password'] ?? '',
        profilePicture: '',
      );
    } else {
      return UserModel.empty();
      // throw Exception('Document data is null');
    }
  }
}
