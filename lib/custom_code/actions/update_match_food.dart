// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int? updateMatchFood() {
  final foodRef = FirebaseFirestore.instance.collection('food');
  final userRef = FirebaseFirestore.instance.collection('users');

  // Get the current user
  final currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser == null) {
    print("User not authenticated");
    return null;
  }

  // Fetch the user document
  userRef.doc(currentUser.uid).get().then((userDoc) {
    if (!userDoc.exists) {
      print("User document not found");
      return null;
    }

    // Fetch food documents
    foodRef.get().then((foodSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      foodSnapshot.docs.forEach((foodDoc) {
        print("Food Document Data: ${foodDoc.data()}");

        int counter = 0;

        // Check each condition and increment counter if the condition is met
        {
          if (foodDoc.data().containsKey('hasReservation') &&
              userDoc.data()!.containsKey('Reservation') &&
              foodDoc['hasReservation'] == userDoc['Reservation']) {
            counter++;
          }

          if (foodDoc.data().containsKey('hasDriveThru') &&
              userDoc.data()!.containsKey('driveThru') &&
              foodDoc['hasDriveThru'] == userDoc['driveThru']) {
            counter++;
          }

          if (foodDoc.data().containsKey('SuitableForWheelchairs') &&
              userDoc.data()!.containsKey('hasDisability') &&
              foodDoc['SuitableForWheelchairs'] == userDoc['hasDisability']) {
            counter++;
          }

          if (foodDoc.data().containsKey('Vegetarianoptions') &&
              userDoc.data()!.containsKey('Vegetarian') &&
              foodDoc['Vegetarianoptions'] == userDoc['Vegetarian']) {
            counter++;
          }

          if (foodDoc.data().containsKey('hasFastService') &&
              userDoc.data()!.containsKey('fastService') &&
              foodDoc['hasFastService'] == userDoc['fastService']) {
            counter++;
          }

          if (foodDoc.data().containsKey('CozyAtmosphere') &&
              userDoc.data()!.containsKey('pref_CozyAtmosphere') &&
              foodDoc['CozyAtmosphere'] == userDoc['pref_CozyAtmosphere']) {
            counter++;
          }

          if (foodDoc.data().containsKey('SuitableForChildren') &&
              userDoc.data()!.containsKey('hasChildren') &&
              foodDoc['SuitableForChildren'] == userDoc['hasChildren']) {
            counter++;
          }
        }
        if (userDoc.data()!.containsKey('schedule')) {
          if ((foodDoc['dtime'] > foodDoc['stime']) ||
              (foodDoc['dtime'] == foodDoc['stime'])) {
            counter = 0;
          }
        }

        final updateData = {'match': counter};

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
