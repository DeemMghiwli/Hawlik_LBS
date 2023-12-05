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

int? distanceHealth(LatLng? userLocation) {
  /// MODIFY CODE ONLY BELOW THIS LINE

//Future<void> sortPlacesByMatchAndDistance(LatLng userLocation) {

  final healthRef = FirebaseFirestore.instance.collection('HealthPlaces');

  healthRef.get().then((healthSnapshot) {
    List<Map<String, dynamic>> places = [];

    healthSnapshot.docs.forEach((doc) {
      places.add(doc.data());
    });

    // Sort by match
    places.sort((a, b) {
      // compare matches
      if (a['match'] > b['match']) {
        return 1;
      } else if (a['match'] < b['match']) {
        return -1;
      } else {
        return 0;
      }
    });

    // Calculate distances
    /* places.forEach((place) {
      var p = 0.017453292519943295;
      var a = 0.5 -
          math.cos((userLocation!.latitude - place["location"]!.latitude) * p) /
              2 +
          math.cos(place["location"].latitude * p) *
              math.cos(userLocation.latitude * p) *
              (1 -
                  math.cos(
                      (userLocation.longitude - place["location"].longitude) *
                          p)) /
              2;
      double result = 12742 * math.asin(math.sqrt(a));
    });
*/
    // Check for equal matches
    for (int i = 0; i < places.length - 1; i++) {
      if (places[i]["match"] == places[i + 1]["match"] &&
          places[i]["distance"] < places[i + 1]["distance"]) {
        places[i]["match"]++;
      }
    }

    // Update matches
    final batch = FirebaseFirestore.instance.batch();

    places.forEach((place) {
      //     batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);
      // batch.update(placesRef.doc(placeDoc.id), updateData);
      batch.update(healthRef.doc('placeId'), place);
    });

    return batch.commit();
  });
  return 1;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
