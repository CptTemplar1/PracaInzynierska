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

String randomStringCode(int length) {
  var rand = math.Random();
  String tmp = String.fromCharCodes(
      List.generate(length, (index) => rand.nextInt(33) + 89));
  return tmp;
}

double stringToDouble(String str) {
  // parse String to double
  try {
    return double.parse(str);
  } catch (exception) {
    return -1;
  }
}

bool showSearchResult(
  String? searchFor,
  String searchIn1,
  String? searchIn2,
  String? searchIn3,
  String? searchIn4,
  String? searchIn5,
) {
  if (searchFor != null) {
    String searchIn = searchIn1 +
        " " +
        (searchIn2 ?? "") +
        " " +
        (searchIn3 ?? "") +
        " " +
        (searchIn4 ?? "") +
        " " +
        (searchIn5 ?? "");
    return searchIn.toLowerCase().contains(searchFor.toLowerCase());
  } else
    return true;
}

bool randomPercentOfSuccess() {
  // generate a random number from 0 to 100 and return true when the number is greater than 40
  final rand = math.Random();
  if (rand.nextInt(100) > 30) {
    return true;
  } else {
    return false;
  }
}

bool checkBlikCode(String code) {
  // check if a given String consists of digits only and is exactly 6 characters long
  RegExp regExp = new RegExp(r'^[0-9]{6}[\s]?$');
  return regExp.hasMatch(code);
}

String closestCity(
  List<CitiesRecord> cities,
  LatLng currentLocation,
) {
  // Use stream builder to get the latitude and longtitude of every city and save it as a double variable
  if (cities.isEmpty) {
    return "null";
  }
  String? closestCityName = "city";
  double shortestDist = 999999999999999;

  for (var city in cities) {
    var location = city.location;
    var dist = math.sqrt(
        math.pow(location!.latitude - currentLocation.latitude, 2) +
            math.pow(location!.longitude - currentLocation.longitude, 2));
    if (dist < shortestDist) {
      closestCityName = city.name;
      shortestDist = dist;
    }
  }

  String result = closestCityName.toString();
  return result;
}

String returnListAsString(List<String>? list) {
  // convert given list to string and return it
  assert(list != null);
  return list.toString().replaceFirst('(', '[ ').replaceFirst(')', ' ]');
}

double calculateFinalPrice(
  int items,
  double singlePrice,
  String poster,
) {
  double finalPrice = items * singlePrice;
  if (poster == "TAK") {
    finalPrice = finalPrice + 15.0;
  }
  return finalPrice;
}

String randomAlphanumericCode(int length) {
  // Generate a random String of given length
  const _kRandomAlphanumeric =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  return String.fromCharCodes(Iterable.generate(length,
          (_) => _kRandomAlphanumeric.codeUnitAt(math.Random().nextInt(62))))
      .toLowerCase();
}

int stringToInteger(String str) {
  // parse String to int
  try {
    return int.parse(str);
  } catch (exception) {
    return -1;
  }
}

bool showSearchResultGreaterThan(
  double baseValue,
  double searchIn,
) {
  if (searchIn >= baseValue)
    return true;
  else
    return false;
}

bool showSearchResultDate(
  DateTime? searchFor,
  DateTime searchIn,
) {
  // Function to compare 2 datetimes, but ignores the time element. Compare just dates.

  //zabezpieczenie, bo DatePicked przed wybraniem daty jest równe null
  if (searchFor != null) {
    final searchForDate =
        DateTime(searchFor.year, searchFor.month, searchFor.day);
    final searchInDate = DateTime(searchIn.year, searchIn.month, searchIn.day);
    return searchForDate == searchInDate;
  } else
    return true;
}

bool showSearchResultSingleOption(
  String? searchFor,
  String searchIn,
) {
  if (searchFor != null)
    return searchIn.toLowerCase().contains(searchFor.toLowerCase());
  else
    return true;
}

double averageThumbsValue(List<int> thumbsList) {
  // Evaluate average value from given list of integers
  var sum = 0;
  for (var i = 0; i < thumbsList.length; i++) {
    sum += thumbsList[i];
  }
  return sum / thumbsList.length;
}

List<DocumentReference> randomKKTubeVideoRef(
  List<DocumentReference> documentList,
  int numberOfDocuments,
) {
  List<int> indices = List<int>.generate(documentList.length, (i) => i);

  indices.shuffle();

  int newCount = numberOfDocuments;

  List<DocumentReference> randomList =
      indices.take(newCount).map((i) => documentList[i]).toList();

  return randomList;
}

bool stringToBool(String str) {
  if (str.toLowerCase() == 'true')
    return true;
  else if (str.toLowerCase() == 'false')
    return false;
  else
    return false;
}

double substractTwoNumbers(
  double num1,
  double num2,
) {
  return num1 - num2;
}

String dateTimeToString(DateTime date) {
  // Convert DateTime to String with only Date in format dd/mm/yyyy
  final formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(date);
}

List<String> returnStringsAsList(
  String str1,
  String str2,
  String str3,
  String str4,
) {
  // return a list of strings given in arguments
  return [str1, str2, str3, str4];
}

int addTwoIntegers(
  int int1,
  int int2,
) {
  return int1 + int2;
}

bool isTooLateForMovie(
  List<String> hours,
  DateTime selectedCalendarDate,
) {
  //Get current time
  DateTime now = DateTime.now();

  //Get the last movie time
  String latestTime = hours.reduce(
      (value, element) => value.compareTo(element) > 0 ? value : element);
  //Convert String to DateTime
  DateTime tmp = DateFormat('HH:mm').parse(latestTime);
  //Create a complete Date + Time of the last movie
  DateTime latestMovieTime = DateTime(
      selectedCalendarDate.year,
      selectedCalendarDate.month,
      selectedCalendarDate.day,
      tmp.hour,
      tmp.minute);

  //Check if the current time is earlier than the latest movie time
  return now.isAfter(latestMovieTime);
}

bool? isSelectedTimeTooLate(
  String time,
  DateTime selectedCalendarDate,
) {
  DateTime now = DateTime.now();

  DateTime tmp = DateFormat('HH:mm').parse(time);
  DateTime selectedTime = DateTime(
      selectedCalendarDate.year,
      selectedCalendarDate.month,
      selectedCalendarDate.day,
      tmp.hour,
      tmp.minute);

  return now.isAfter(selectedTime);
}
