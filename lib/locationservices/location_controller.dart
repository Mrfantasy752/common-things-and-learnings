import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  late bool locationstatus;
  late LocationPermission permission;
  bool haspermission = false;
  String lat = "", long = '';
  late Position position;
  late StreamSubscription<Position> positionstream;
  List<Placemark> userlocation = [];
  String currentaddress = "";

  checkServiceStatus() async {
    locationstatus = await Geolocator.isLocationServiceEnabled();

    if (locationstatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        print("requesting for permission");
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("permission denied");
        } else if (permission == LocationPermission.deniedForever) {}
      } else {
        haspermission = true;
        print("permission given already");
      }
    } else {
      print("permission given already");
      haspermission = true;
    }

    if (haspermission) {
      getLocation();
    }

    update();
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition();
    lat = position.latitude.toString();
    long = position.longitude.toString();

    positionstream = Geolocator.getPositionStream().listen((position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
    });
    userlocation =
        await placemarkFromCoordinates(double.parse(lat), double.parse(long));
    Placemark place = userlocation.first;
    currentaddress =
        place.street.toString() + " " + place.postalCode.toString();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkServiceStatus();
  }
}
