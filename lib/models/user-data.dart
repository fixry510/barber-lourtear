import 'package:get/get_state_manager/get_state_manager.dart';

class UserData {
  late String userId;
  late String email;
  late String fullName;
  late String phoneNumber;
  late String position;
  late String profileImage;

  UserData({
    required this.userId,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.position,
    required this.profileImage,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    position = json['position'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['position'] = this.position;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
