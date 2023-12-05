// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

int? fillOrder() {
  final foodRef = FirebaseFirestore.instance.collection('HealthPlaces');

  foodRef.get().then((foodSnapshot) {
    final batch = FirebaseFirestore.instance.batch();

    for (int i = 0; i < foodSnapshot.docs.length; i++) {
      var match = foodSnapshot.docs[i]['match'];

      for (int j = i + 1; j < foodSnapshot.docs.length; j++) {
        // Compare the 'match' values and 'distance' values
        if (foodSnapshot.docs[i]['match'] == foodSnapshot.docs[j]['match'] &&
            foodSnapshot.docs[i]['distance'] <
                foodSnapshot.docs[j]['distance']) {
          match++;
        }
      }

      // Create a map with the 'match' field set to the updated value
      final updateData = {'match': match};

      // Update the 'match' field in the health document using a batch
      batch.update(foodRef.doc(foodSnapshot.docs[i].id), updateData);
    }

    // Commit the batch to update Firestore documents
    batch.commit().then((_) {
      print("Batch update successful");
    }).catchError((error) {
      print("Error committing batch: $error");
    });
  }).catchError((error) {
    print("Error fetching HealthPlaces collection: $error");
  });

  return null;
}
