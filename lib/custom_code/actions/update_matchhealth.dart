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

int? updateMatchhealth() {
  final healthRef = FirebaseFirestore.instance.collection('HealthPlaces');
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
    healthRef.get().then((healthSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      healthSnapshot.docs.forEach((healthDoc) {
        print("Health Document Data: ${healthDoc.data()}");

        int counter = 0;

        // Check each condition and increment counter if the condition is met

        {
          if (healthDoc.data().containsKey('hasStairs') &&
              userDoc.data()!.containsKey('hasDisability') &&
              healthDoc['hasStairs'] == userDoc['hasDisability']) {
            counter++;
          }

          if (healthDoc.data().containsKey('acceptsHealthInsurance') &&
              userDoc.data()!.containsKey('hasHealthInsurance') &&
              healthDoc['acceptsHealthInsurance'] ==
                  userDoc['hasHealthInsurance']) {
            counter += 5;
          }

          if (healthDoc.data().containsKey('BathroomForWheelchairs') &&
              userDoc.data()!.containsKey('hasDisability') &&
              healthDoc['BathroomForWheelchairs'] == userDoc['hasDisability']) {
            counter++;
          }
        }
        if (userDoc.data()!.containsKey('schedule')) {
          if ((healthDoc['dtime'] > healthDoc['stime']) ||
              (healthDoc['dtime'] == healthDoc['stime'])) {
            counter = 0;
          }
        }

        final updateData = {'match': counter};

        batch.update(healthRef.doc(healthDoc.id), updateData);
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
