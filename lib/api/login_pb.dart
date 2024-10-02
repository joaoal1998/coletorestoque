import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class LoginPB {
  final String username;
  final String password;

  LoginPB({required this.username, required this.password});

  final pb = PocketBase('https://pb.kinitos.cloud/');

  Future<void> signIn(username, password) async {
    await pb.collection('users').authWithPassword(username, password);
  }
}
