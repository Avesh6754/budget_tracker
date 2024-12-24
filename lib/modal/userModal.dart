import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

class UserModal {
  String? name, email, phone, age;
  Uint8List? image;

  UserModal(
      {required this.age,
      required this.phone,
      required this.email,
      required this.name,
      required this.image});

  factory UserModal.fromMap(Map m1) {
    return UserModal(
        age: m1['age'],
        phone: m1['phone'],
        email: m1['email'],
        name: m1['name'],
        image: m1['image']);
  }
}
