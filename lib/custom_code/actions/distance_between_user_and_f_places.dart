// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

import 'dart:math' as math;

int? distanceBetweenUserAndFPlaces(LatLng? positionTwo) {
  final foodRef = FirebaseFirestore.instance.collection('food');
  final userRef = FirebaseFirestore.instance.collection('users');

  final currentUser = FirebaseAuth.instance.currentUser;
  double result = 0;

  if (currentUser == null) {
    print("User not authenticated");
    return null;
  }
  userRef.doc(currentUser.uid).get().then((userDoc) {
    if (!userDoc.exists) {
      print("User document not found");
      return null;
    }

    final userL = userDoc['userLocation'];

    foodRef.get().then((foodSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      foodSnapshot.docs.forEach((foodDoc) {
        print("health Document Data: ${foodDoc.data()}");
        final foodL = foodDoc['location'];
        if (foodDoc.data().containsKey('location') &&
            userDoc.data()!.containsKey('userLocation')) {
          var p = 0.017453292519943295;
          var a = 0.5 -
              math.cos((userL!.latitude - foodL!.latitude) * p) / 2 +
              math.cos(foodL.latitude * p) *
                  math.cos(userL.latitude * p) *
                  (1 - math.cos((userL.longitude - foodL.longitude) * p)) /
                  2;
          result = 12742 * math.asin(math.sqrt(a));
        }

        final updateData = {'distance': result};
        batch.update(foodRef.doc(foodDoc.id), updateData);
      });

      batch.commit().then((_) {
        print("Batch update successful");
      }).catchError((error) {
        print("Error committing batch: $error");
      });
    }).catchError((error) {
      print("Error fetching food collection: $error");
    });
  });

  return null;
}
