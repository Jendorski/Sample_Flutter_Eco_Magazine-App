import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_eco_magazine_app/models/userProfile/UserProfile.dart';
import 'package:sample_eco_magazine_app/services/locator.dart';
import 'package:sample_eco_magazine_app/services/homeService/HomeService.dart';

abstract class LoginService{

  /// This function helps to login a user
  Future signInUser({String email, String password});

  Future<bool> isUserLoggedIn();

}

class LoginServiceImpl implements LoginService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserProfile _currentUser;
  UserProfile get currentUser => _currentUser;

  final _userService = locator<HomeService>();

  String _errorMessage = '';

  /// This function makes the current application user available everywhere in the application.
  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _userService.getUser(emailAddress: user.email);
    }
  }

  @override
  Future signInUser({String email, String password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      _errorMessage = _getErrorMessageFromFirebaseException(e);
      return _errorMessage;
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

  @override
  Future<bool> isUserLoggedIn() async{
    bool _isLoggedIn = false;

    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        _populateCurrentUser(user);
        _isLoggedIn = true;
      } else {
        _isLoggedIn = false;
      }
    });
    return _isLoggedIn;
  }

}