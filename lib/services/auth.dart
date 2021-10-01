import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {

  bool get isSignedIn => _auth.currentUser != null;

}
