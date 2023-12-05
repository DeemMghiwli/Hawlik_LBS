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

int? reachInTimeHealth(DateTime? currentTime) {
  final healthRef = FirebaseFirestore.instance.collection('HealthPlaces');
  final userRef = FirebaseFirestore.instance.collection('users');

  final currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser == null) {
    print("User not authenticated");
    return null;
  }
  userRef.doc(currentUser.uid).get().then((userDoc) {
    if (!userDoc.exists) {
      print("User document not found");
      return null;
    }
    final userS = userDoc['schedule'];
    final userL = userDoc['userLocation'];

    healthRef.get().then((healthSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      healthSnapshot.docs.forEach((healthDoc) {
        int scheduleInt = 0;
        int distanceInt = 0;
        print("health Document Data: ${healthDoc.data()}");

        if (userS != null) {
          // Calculate the difference in minutes
          var schedule = userS!.toDate().difference(currentTime!).inMinutes;

          scheduleInt = schedule.toInt();

          // Create a map with the 'stime' field set to the calculated value
          final updateData2 = {'stime': scheduleInt};

          // Update the 'stime' field in the food document using a batch
          batch.update(healthRef.doc(healthDoc.id), updateData2);

          print("Food Doc ID: ${userDoc.id}");
          print("Food Opening Time: $userS");
          print("Calculated Difference in Minutes: $scheduleInt");
        }
        final foodL = healthDoc['Location'];
        if (healthDoc.data().containsKey('Location') &&
            userDoc.data()!.containsKey('userLocation')) {
          var p = 0.017453292519943295;
          var a = 0.5 -
              math.cos((userL!.latitude - foodL!.latitude) * p) / 2 +
              math.cos(foodL.latitude * p) *
                  math.cos(userL.latitude * p) *
                  (1 - math.cos((userL.longitude - foodL.longitude) * p)) /
                  2;
          double result = 12742 * math.asin(math.sqrt(a));
          double time = (result / 10.503) * 60;
          distanceInt = time.toInt();
        }

        print("Schedule Int: $scheduleInt");
        final updateData = {'dtime': distanceInt};
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
