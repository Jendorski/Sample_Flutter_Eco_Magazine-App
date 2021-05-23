import 'package:firebase_auth/firebase_auth.dart';

import 'package:sample_eco_magazine_app/services/homeService/HomeService.dart';
import 'package:sample_eco_magazine_app/models/userProfile/UserProfile.dart';
import '../locator.dart';

abstract class SignUpService{

  /// This function helps to signup a user
  Future signUpUser(
      {String firstName,
        String lastName,
        String email,
        String phoneNumber,
        String password});

}

class SignUpServiceImpl implements SignUpService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final _userService = locator<HomeService>();

  String _errorMessage = '';

  @override
  Future signUpUser({String firstName, String lastName, String email, String phoneNumber, String password}) async {
    try{

      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

     var _currentUser = UserProfile(
        email: email,
        lastName: lastName,
        phoneNumber: phoneNumber,
        password: password,
        firstName: firstName,
        dateCreated: new DateTime.now().toIso8601String(),
      );

      await _userService.createUser(user: _currentUser);

      return authResult.user != null;
    }
    on FirebaseAuthException catch (e) {
    print('Error: ${e.message}');
    _errorMessage = _getErrorMessageFromFirebaseException(e);
    return Future.value(_errorMessage);
    }

  }

  /// This function returns a human readable error back to the user
  String _getErrorMessageFromFirebaseException(
      FirebaseAuthException exception) {
    print('Firebase Exception: $exception');
    switch (exception.code.toLowerCase()) {
      case 'email-already-in-use':
        return 'An account already exists for the email you\'re trying to use. Login instead.';
      case 'invalid-email':
        return 'The email you\'re using is invalid. Please use a valid email.';
      case 'operation-not-allowed':
        return 'The authentication is not enabled on Firebase. Please enable the Authentitcation type on Firebase';
      case 'weak-password':
        return 'Your password is too weak. Please use a stronger password.';
      case 'wrong-password':
        return 'You seemed to have entered the wrong password. Double check it and try again.';
      case 'user-not-found':
        return 'An account with this details don\'t exist. Register instead.';
      default:
        return exception.message ??
            'Something went wrong on our side. Please try again';
    }
  }


}