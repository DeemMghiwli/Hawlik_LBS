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

int? updateMatchshop() {
  final shopRef = FirebaseFirestore.instance.collection('ShopPlaces');
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
    shopRef.get().then((shopSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      shopSnapshot.docs.forEach((shopDoc) {
        print("Food Document Data: ${shopDoc.data()}");

        int counter = 1;
        {
          if (shopDoc.data().containsKey('parkingDA') &&
              userDoc.data()!.containsKey('DisabilitiesPark') &&
              shopDoc['parkingDA'] == userDoc['DisabilitiesPark']) {
            counter++;
          }
          if (shopDoc.data().containsKey('parkingN') &&
              userDoc.data()!.containsKey('pref_Parking') &&
              shopDoc['parkingN'] == userDoc['pref_Parking']) {
            counter++;
          }

          if (shopDoc.data().containsKey('Supermarket') &&
              userDoc.data()!.containsKey('perf_SuperMarket') &&
              shopDoc['Supermarket'] == userDoc['perf_SuperMarket']) {
            counter++;
          }
          if (shopDoc.data().containsKey('musimepark') &&
              userDoc.data()!.containsKey('perf_AmusPark') &&
              shopDoc['musimepark'] == userDoc['perf_AmusPark']) {
            counter++;
          }
          if (shopDoc.data().containsKey('cenma') &&
              userDoc.data()!.containsKey('perf_Movies') &&
              shopDoc['cenma'] == userDoc['perf_Movies']) {
            counter++;
          }
          if (shopDoc.data().containsKey('OutdoorStore') &&
              userDoc.data()!.containsKey('pref_OutDoorStore') &&
              shopDoc['OutdoorStore'] == userDoc['pref_OutDoorStore']) {
            counter++;
          }
          if (shopDoc.data().containsKey('FoodCor') &&
              userDoc.data()!.containsKey('prefFoodCort') &&
              shopDoc['FoodCor'] == userDoc['prefFoodCort']) {
            counter++;
          }
          if (shopDoc.data().containsKey('AccsptChildren') &&
              userDoc.data()!.containsKey('hasChildren') &&
              shopDoc['AccsptChildren'] == userDoc['hasChildren']) {
            counter++;
          }
        }

        if (userDoc.data()!.containsKey('schedule')) {
          if ((shopDoc['dtime'] > shopDoc['stime']) ||
              (shopDoc['dtime'] == shopDoc['stime'])) {
            counter = 0;
          }
        }

        // Check each condition and increment counter if the condition is met

        final updateData = {'match': counter};

        batch.update(shopRef.doc(shopDoc.id), updateData);
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
