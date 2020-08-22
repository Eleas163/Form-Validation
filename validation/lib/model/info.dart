import 'package:flutter/material.dart';

class Info{
  final String name;
  final String email;
  final String password;

  Info({
    this.name,
    this.email,
    this.password
  });
}

class InfoList with ChangeNotifier {
List<Info> _items = [
  Info(
      name: 'HuNgRy',
    email: 'emonshahed1234@gmail.com',
    password: '12345'
  ),
  Info(
      name: 'Admin',
      email: 'admin@example.com',
      password: '12345'
  ),

];

List<Info> get items {
  return [..._items];
}

}