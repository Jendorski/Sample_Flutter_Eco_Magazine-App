import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_eco_magazine_app/models/userProfile/UserProfile.dart';

abstract class HomeService{

  /// This function creates a user into our users collection.
  Future createUser({UserProfile user});

  /// This function gets a user based on the user's email address from the users collection.
  Future getUser({String emailAddress});

  /// This function allows a user to edit/update their data in the users collection.
  Future editUser({UserProfile user});

  /// This function helps to delete a user from the users collection but not the platform auth process
  Future deleteUser({String emailAddress});

  /// This function helps to get the list of users available by removing the loggedIn user
  Stream getUsers({String emailAddress});

  Stream getMagazines();

}

class HomeServiceImpl implements HomeService{

  final CollectionReference _usersCollectionReference =
  FirebaseFirestore.instance.collection('users');

  final StreamController<List<UserProfile>> _usersController =
  StreamController<List<UserProfile>>.broadcast();

  @override
  Future createUser({UserProfile user}) async {
    try {
      await _usersCollectionReference.doc(user.email).set(user.toJson());
    } catch (e) {
      print('Error (Creating User): $e');
      return 'Error in creating user data';
    }
  }

  @override
  Future deleteUser({String emailAddress}) async {
    try {
      await _usersCollectionReference.doc(emailAddress).delete();
    } catch (e) {
      print('Error (deleting User): $e');
      return 'Error deleting user data';
    }
  }

  @override
  Future editUser({UserProfile user}) async {
    try {
      await _usersCollectionReference.doc(user.email).update(user.toJson());
    } catch (e) {
      print('Error (Updating User): $e');
      return 'Error updating user data';
    }
  }

  @override
  Stream getMagazines() {
    // TODO: implement getMagazines
    throw UnimplementedError();
  }

  @override
  Future getUser({String emailAddress}) async {
    try {
      final userData = await _usersCollectionReference.doc(emailAddress).get();
      return UserProfile.fromJson(userData.data());
    } catch (e) {
      print('Error (Getting User): $e');
      return 'Error getting user data';
    }
  }

  @override
  Stream getUsers({String emailAddress}) {
    try {
      // Register the handler for when the teams data changes
      _usersCollectionReference.snapshots().listen((usersSnapshot) {
        if (usersSnapshot.docs.isNotEmpty) {
          final _users = usersSnapshot.docs
              .map((snapshot) => UserProfile.fromJson(snapshot.data()))
              .where((mappedItem) => mappedItem.email != emailAddress)
              .toList();

          // Add the users onto the controller
          _usersController.add(_users);
        }
      });
      return _usersController.stream;
    } catch (e) {
      print('Error (Fetching User): $e');
    }
  }

}