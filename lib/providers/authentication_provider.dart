//Packages
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

//Services
import '../services/database_service.dart';
import '../services/navigation_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseService _databaseService;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();
  }

  Future<void> loginUsingEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      debugPrint("error logging user into firebase");
    } catch (e) {
      debugPrint('$e');
    }
  }
}
