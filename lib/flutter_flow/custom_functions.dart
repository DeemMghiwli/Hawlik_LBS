import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int? getMatch() {
  final usersRef = FirebaseFirestore.instance.collection('users');
  final shopPlacesRef = FirebaseFirestore.instance.collection('ShopPlaces');

  usersRef.get().then((usersSnapshot) {
    shopPlacesRef.get().then((shopPlacesSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      usersSnapshot.docs.forEach((userDoc) {
        final userData = userDoc.data() as Map<String, dynamic>;

        shopPlacesSnapshot.docs.forEach((shopPlaceDoc) {
          final shopPlaceData = shopPlaceDoc.data() as Map<String, dynamic>;

          int counter = 0;

          if (shopPlaceData['food_cort'] == userData['perf_restursntcaffe']) {
            counter++;
          }
          if (shopPlaceData['musimepark'] == userData['perf_AmusPark']) {
            counter++;
          }
          if (shopPlaceData['Supermarket'] == userData['perf_SuperMarket']) {
            counter++;
          }

          // Create a map with the 'match' field as an integer
          final updateData = {'match': counter};

          // Update the 'match' field in the shopPlace document using a batch
          batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);
        });
      });

      // Commit the batch to update Firestore documents
      batch.commit();
    }).catchError((error) {
      print("Error fetching shopPlaces: $error");
    });
  }).catchError((error) {
    print("Error fetching users: $error");
  });
  return 1;
}

int? healthMatch() {
  final usersRef = FirebaseFirestore.instance.collection('users');
  final shopPlacesRef = FirebaseFirestore.instance.collection('HealthPlaces');

  usersRef.get().then((usersSnapshot) {
    shopPlacesRef.get().then((shopPlacesSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      usersSnapshot.docs.forEach((userDoc) {
        final userData = userDoc.data() as Map<String, dynamic>;

        shopPlacesSnapshot.docs.forEach((shopPlaceDoc) {
          final shopPlaceData = shopPlaceDoc.data() as Map<String, dynamic>;

          int counter = 0;

          if (userData['hasDisability'] != shopPlaceData['hasStairs']) {
            counter++;
          }

          // Check if the user has health insurance and the health place accepts it
          if (userData['hasHealthInsurance'] ==
              shopPlaceData['acceptsHealthInsurance']) {
            counter += 5;
          }
          if (userData['hasDisability'] ==
              shopPlaceData['BathroomForWheelchairs']) {
            counter++;
          }

          // Create a map with the 'match' field as an integer
          final updateData = {'match': counter};

          // Update the 'match' field in the shopPlace document using a batch
          batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);
        });
      });

      // Commit the batch to update Firestore documents
      batch.commit();
    }).catchError((error) {
      print("Error fetching shopPlaces: $error");
    });
  }).catchError((error) {
    print("Error fetching users: $error");
  });
  return 1;
}

int? foodMatch() {
  final usersRef = FirebaseFirestore.instance.collection('users');
  final shopPlacesRef = FirebaseFirestore.instance.collection('food');

  usersRef.get().then((usersSnapshot) {
    shopPlacesRef.get().then((shopPlacesSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      usersSnapshot.docs.forEach((userDoc) {
        final userData = userDoc.data() as Map<String, dynamic>;

        shopPlacesSnapshot.docs.forEach((shopPlaceDoc) {
          final shopPlaceData = shopPlaceDoc.data() as Map<String, dynamic>;

          int counter = 0;

          if (shopPlaceData['hasReservation'] == userData['perf_reservation']) {
            counter++;
          }
          if (shopPlaceData['hasFastService'] == userData['perf_fastService']) {
            counter++;
          }
          if (shopPlaceData['hasDriveThru'] == userData['perf_driveThru']) {
            counter++;
          }
          if (shopPlaceData['SuitableForWheelchairs'] ==
              userData['hasDisability']) {
            counter++;
          }
          if (shopPlaceData['Vegetarianoptions'] == userData['Vegetarian']) {
            counter++;
          }
          if (shopPlaceData['CozyAtmosphere'] ==
              userData['pref_CozyAtmosphere']) {
            counter++;
          }
          if (shopPlaceData['SuitableForChildren'] == userData['hasChildren']) {
            counter++;
          }
          // Create a map with the 'match' field as an integer
          final updateData = {'match': counter};

          // Update the 'match' field in the shopPlace document using a batch
          batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);
        });
      });

      // Commit the batch to update Firestore documents
      batch.commit();
    }).catchError((error) {
      print("Error fetching shopPlaces: $error");
    });
  }).catchError((error) {
    print("Error fetching users: $error");
  });
  return 1;
}

List<String>? maxFoodMatch() {
  final usersRef = FirebaseFirestore.instance.collection('users');
  final shopPlacesRef = FirebaseFirestore.instance.collection('food');

  int maxMatch = 0;
  List<String> maxMatchRestaurantNames = [];

  usersRef.get().then((usersSnapshot) {
    shopPlacesRef.get().then((shopPlacesSnapshot) {
      for (QueryDocumentSnapshot userDoc in usersSnapshot.docs) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        for (QueryDocumentSnapshot shopPlaceDoc in shopPlacesSnapshot.docs) {
          Map<String, dynamic> shopPlaceData =
              shopPlaceDoc.data() as Map<String, dynamic>;

          // Check for seafood allergy
          if (userData['hasSeafoodAllergy'] && shopPlaceData['hasSeafood']) {
            continue; // Skip seafood restaurants for seafood allergy
          }

          int matchPoints = 0;

          // Check for other preferences and calculate match points
          if (shopPlaceData['hasReservation'] == userData['perf_reservation']) {
            matchPoints++;
          }
          if (shopPlaceData['hasFastService'] == userData['perf_fastService']) {
            matchPoints++;
          }
          if (shopPlaceData['hasDriveThru'] == userData['perf_driveThru']) {
            matchPoints++;
          }

          // Update the max match
          if (matchPoints > maxMatch) {
            maxMatch = matchPoints;
            maxMatchRestaurantNames = [shopPlaceData['name']];
          } else if (matchPoints == maxMatch) {
            maxMatchRestaurantNames.add(shopPlaceData['name']);
          }
        }
      }

      // maxMatchRestaurantNames now contains the names of the restaurants with the maximum match
      print('Restaurants with maximum match: $maxMatchRestaurantNames');
    }).catchError((error) {
      print("Error fetching shopPlaces: $error");
    });
  }).catchError((error) {
    print("Error fetching users: $error");
  });

  return maxMatchRestaurantNames;
}

double? returnDistanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // uncomment the line below if you want the result to be rounded
  // double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return result;
}

String? printdistance(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  String roundRe = result.toStringAsFixed(2); // 2 decimal places
  double time = (result / 10.503) * 60;
  String roundTi = time.toStringAsFixed(0); // 2 decimal places
  //String distance = roundRe + " km  " + roundTi + " min";
  String distance = roundRe + " كم  " + roundTi + " دقيقة ";
  // print(distance);
  return distance;
}

List<dynamic>? sortPlacesByMatchAndDistance(LatLng? userLocation) {
  final shopPlacesRef = FirebaseFirestore.instance.collection('HealthPlaces');

  //QuerySnapshot placesSnapshot = shopPlacesRef.get() as QuerySnapshot<Object?>;
  Future<QuerySnapshot<Map<String, dynamic>>> placesSnapshot =
      shopPlacesRef.get();

  List<Map<String, dynamic>> places = [];

  //placesSnapshot.docs.forEach((doc) {
  // Map<String, dynamic> placeData = doc.data() as Map<String, dynamic>;
  //places.add(placeData);
  // });

  placesSnapshot.then((snapshot) {
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> placeData = doc.data() as Map<String, dynamic>;
      places.add(placeData);

//
      places.sort((a, b) {
        if (a['match'] > b['match']) {
          return -1;
        } else if (a['match'] < b['match']) {
          return 1;
        } else {
          // match is the same, sort by distance
          /* String distanceA = printdistance(
                LatLng(a['location'].latitude, a['location'].longitude),
                userLocation)
            .toString();
        String distanceB = printdistance(
                LatLng(b['location'].latitude, b['location'].longitude),
                userLocation)
            .toString();
        return distanceA.compareTo(distanceB);*/
          double? distanceA = distanceFun(
              LatLng(a['location'].latitude, a['location'].longitude),
              userLocation);
          double? distanceB = distanceFun(
              LatLng(b['location'].latitude, b['location'].longitude),
              userLocation);
          return distanceA!.compareTo(distanceB!);
        }

        // final updateData = {'match': counter};

        // Update the 'match' field in the shopPlace document using a batch
        //  batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);
      });
    });
  });
  return places;
}

List<String>? healthSortedMatch() {
  final usersRef = FirebaseFirestore.instance.collection('users');
  final shopPlacesRef = FirebaseFirestore.instance.collection('HealthPlaces');
  final Map<String, int> sortedPlaces = {};
  List<String>? sortedPlaceIds;
  usersRef.get().then((usersSnapshot) {
    shopPlacesRef.get().then((shopPlacesSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      usersSnapshot.docs.forEach((userDoc) {
        final userData = userDoc.data() as Map<String, dynamic>;

        shopPlacesSnapshot.docs.forEach((shopPlaceDoc) {
          final shopPlaceData = shopPlaceDoc.data() as Map<String, dynamic>;

          int counter = 0;

          if (userData['hasDisability'] != shopPlaceData['hasStairs']) {
            counter++;
          }

          // Check if the user has health insurance and the health place accepts it
          if (userData['hasHealthInsurance'] ==
              shopPlaceData['acceptsHealthInsurance']) {
            counter++;
          }
          if (userData['hasDisability'] ==
              shopPlaceData['BathroomForWheelchairs']) {
            counter++;
          }

          // Create a map with the 'match' field as an integer
          final updateData = {'match': counter};

          // Update the 'match' field in the shopPlace document using a batch
          batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);

          final matchScore = counter;
          sortedPlaces[shopPlaceDoc.id] = matchScore;
        });
      });

      // Commit the batch to update Firestore documents
      batch.commit().then((_) {
        // Sort the map based on match score and return it
        final sortedEntries = sortedPlaces.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

        final sortedPlaceIds = sortedEntries.map((entry) => entry.key).toList();
        // Handle the sortedPlaceIds as needed, or return it
      }).catchError((error) {
        print("Error committing batch: $error");
      });
    }).catchError((error) {
      print("Error fetching shopPlaces: $error");
    });
  }).catchError((error) {
    print("Error fetching users: $error");
  });

  return sortedPlaceIds; // You can return null here, or handle the sorted list in a callback.} // You can return null here, or handle the sorted list in a callback.

  /*Map<String, int> sortedPlaces = {};
  final usersRef = FirebaseFirestore.instance.collection('users');
  final shopPlacesRef = FirebaseFirestore.instance.collection('HealthPlaces');

  usersRef.get().then((usersSnapshot) {
    shopPlacesRef.get().then((shopPlacesSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      usersSnapshot.docs.forEach((userDoc) {
        final placeData = doc.data();
        final userData = userDoc.data() as Map<String, dynamic>;

        shopPlacesSnapshot.docs.forEach((shopPlaceDoc) {
          final shopPlaceData = shopPlaceDoc.data() as Map<String, dynamic>;

          int counter = 0;

          if (userData['hasDisability'] != shopPlaceData['hasStairs']) {
            counter++;
          }

          // Check if the user has health insurance and the health place accepts it
          if (userData['hasHealthInsurance'] ==
              shopPlaceData['acceptsHealthInsurance']) {
            counter++;
          }
          if (userData['hasDisability'] ==
              shopPlaceData['BathroomForWheelchairs']) {
            counter++;
          }

          // Create a map with the 'match' field as an integer
          final updateData = {'match': counter};

          // Update the 'match' field in the shopPlace document using a batch
          batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);
          final matchScore = counter;
          sortedPlaces[doc.id] = matchScore;
        });
      });

      // Commit the batch to update Firestore documents
      batch.commit();
    }).catchError((error) {
      print("Error fetching shopPlaces: $error");
    });
  }).catchError((error) {
    print("Error fetching users: $error");
  });

  sortedPlaces.entries.sort((a, b) => b.value.compareTo(a.value));

  return sortedPlaces.entries.toList();
*/
}

double? distanceFun(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  //String roundRe = result.toStringAsFixed(2); // 2 decimal places
  // String distance = roundRe + " km";
  // print(distance);
  final shopPlacesRef = FirebaseFirestore.instance.collection('HealthPlaces');
  final distanceData = {'distance': result};
  shopPlacesRef.doc('distance').update(distanceData);

  return result;
}

int? sortedPlaces(LatLng? userLocation) {
//Future<void> sortPlacesByMatchAndDistance(LatLng userLocation) {

  final placesRef = FirebaseFirestore.instance.collection('HealthPlaces');

  placesRef.get().then((placesSnapshot) {
    List<Map<String, dynamic>> places = [];

    placesSnapshot.docs.forEach((doc) {
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
    places.forEach((place) {
      place["distance"] = distanceFun(place["location"], userLocation);
    });

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
      batch.update(placesRef.doc('placeId'), place);
    });

    return batch.commit();
  });
  return 1;
}

int? timechecker(
  DateTime? schedule,
  DateTime? currentTime,
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  final shopPlacesRef = FirebaseFirestore.instance.collection('shopPlaces');

  // Fetch the shopPlacesSnapshot
  shopPlacesRef.get().then((shopPlacesSnapshot) {
    final batch = FirebaseFirestore.instance.batch();

    shopPlacesSnapshot.docs.forEach((shopPlaceDoc) {
      int numberOfMatches = 0;

      var p = 0.017453292519943295;
      var a = 0.5 -
          math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
          math.cos(positionOne.latitude * p) *
              math.cos(positionTwo.latitude * p) *
              (1 -
                  math.cos(
                      (positionTwo.longitude - positionOne.longitude) * p)) /
              2;
      double result = 12742 * math.asin(math.sqrt(a));
      double time = (result / 10.503) * 60;

      var timeDifference = schedule!.difference(currentTime!).inMinutes;
      var timeInt = time.toInt();
      var diffInt = timeDifference.toInt();

      if (timeInt <= diffInt) {
        numberOfMatches = 1;
      }

      // Create a map with the 'match' field as an integer
      final updateData = {'match': numberOfMatches};

      // Update the 'match' field in the shopPlace document using a batch
      batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);
    });

    // Commit the batch to update Firestore documents
    batch.commit().then((_) {
      print("Batch update successful");
    }).catchError((error) {
      print("Error committing batch: $error");
    });
  }).catchError((error) {
    print("Error fetching shopPlaces: $error");
  });

  return 1;
}

int? storeDistanceToFirestore() {
  final usersRef = FirebaseFirestore.instance.collection('users');

  usersRef.get().then((usersSnapshot) {
    usersSnapshot.docs.forEach((userDoc) {
      final userData = userDoc.data();

      final foodRef = FirebaseFirestore.instance.collection('HealthPlaces');

      foodRef.get().then((foodSnapshot) {
        foodSnapshot.docs.forEach((foodDoc) {
          final foodData = foodDoc.data();

          double? distance =
              distanceFun(userData['location'], foodDoc['location']);

          print('Calculated distance: $distance');

          foodRef.doc(foodDoc.id).update({'distance': distance});
        });
      });
    });
  });
/*
  final usersRef = FirebaseFirestore.instance.collection('users');
  final foodRef = FirebaseFirestore.instance.collection('HealthPlaces');

  final usersSnapshotFuture = usersRef.get();
  final foodSnapshotFuture = foodRef.get();

  usersSnapshotFuture.then((usersSnapshot) {
    foodSnapshotFuture.then((foodSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      usersSnapshot.docs.forEach((userDoc) {
        final userData = userDoc.data();

        foodSnapshot.docs.forEach((foodDoc) {
          final foodData = foodDoc.data();
          double result = 0;
          var p = 0.017453292519943295;
          var a = 0.5 -
              math.cos((userData['userLocation']!.latitude -
                          foodData['Location']!.latitude) *
                      p) /
                  2 +
              math.cos(foodData['Location'].latitude * p) *
                  math.cos(userData['userLocation'].latitude * p) *
                  (1 -
                      math.cos((userData['userLocation'].longitude -
                              foodData['Location'].longitude) *
                          p)) /
                  2;
          result = 12742 * math.asin(math.sqrt(a));

          String distance = result.toStringAsFixed(2);

          // Create a map with the 'distance2' field as a string
          final updateData = {'distance': distance};

          // Update the 'distance2' field in the food document using a batch
          batch.update(foodRef.doc(foodDoc.id), updateData);
        });

        // Commit the batch to update Firestore documents
        batch.commit().then((_) {
          return 1;
        }).catchError((error) {
          print("Error committing batch: $error");
          return 0;
        });
      });
    }).catchError((error) {
      print("Error fetching food: $error");
      return 0;
    });
  }).catchError((error) {
    print("Error fetching users: $error");
    return 0;
  });
  return 1; // */
}

int? testSortedPlaces(LatLng? userLocation) {
  final usersRef = FirebaseFirestore.instance.collection('users');
  final shopPlacesRef = FirebaseFirestore.instance.collection('HealthPlaces');

  usersRef.get().then((usersSnapshot) {
    shopPlacesRef.get().then((shopPlacesSnapshot) {
      final batch = FirebaseFirestore.instance.batch();

      usersSnapshot.docs.forEach((userDoc) {
        final userData = userDoc.data() as Map<String, dynamic>;

        shopPlacesSnapshot.docs.forEach((shopPlaceDoc) {
          final shopPlaceData = shopPlaceDoc.data() as Map<String, dynamic>;

          int counter = 0;

          if (userData['hasDisability'] != shopPlaceData['hasStairs']) {
            counter++;
          }

          // Check if the user has health insurance and the health place accepts it
          if (userData['hasHealthInsurance'] ==
              shopPlaceData['acceptsHealthInsurance']) {
            counter += 5;
          }
          if (userData['hasDisability'] ==
              shopPlaceData['BathroomForWheelchairs']) {
            counter++;
          }

          // Create a map with the 'match' field as an integer
          final updateData = {'match': counter};

          // Update the 'match' field in the shopPlace document using a batch
          batch.update(shopPlacesRef.doc(shopPlaceDoc.id), updateData);
        });
      });

      // Commit the batch to update Firestore documents
      batch.commit().then((_) {
        final placesRef = FirebaseFirestore.instance.collection('HealthPlaces');

        placesRef.get().then((placesSnapshot) {
          List<Map<String, dynamic>> places = [];

          placesSnapshot.docs.forEach((doc) {
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
          places.forEach((place) {
            place["distance"] = distanceFun(place["Location"], userLocation);
          });

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
            batch.update(placesRef.doc(place['placeId']), place);
          });

          // Reset 'match' field for new users
          usersSnapshot.docs.forEach((userDoc) {
            batch.update(userDoc.reference, {'match': 0});
          });

          return batch.commit();
        });
      }).catchError((error) {
        print("Error updating shopPlaces: $error");
      });
    }).catchError((error) {
      print("Error fetching shopPlaces: $error");
    });
  }).catchError((error) {
    print("Error fetching users: $error");
  });

  return 1;
}

int? updatePrefCienmaifHasChildrenTrue() {
  // i want to give the attribute(PrefCienma)True subcollection (interst)if users( hascheldrn)true
  FirebaseFirestore.instance
      .collection('users')
      .where('hasChildren', isEqualTo: true)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(doc.id)
          .collection('Interests')
          .doc('PrefCinema')
          .set({'value': true});
    });
  });
  return 1; // or any other value as needed
}
