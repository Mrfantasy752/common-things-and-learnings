import 'package:flutter/material.dart';
import 'package:flutter_application_1/locationservices/location_controller.dart';
import 'package:get/get.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({super.key});
  LocationController controller = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (controller) {
        return Scaffold(
            body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(color: Colors.amber[50]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {
                  controller.checkServiceStatus();
                },
              ),
              controller.haspermission != null
                  ? Text(
                      "latitude ${controller.lat} \n longitude ${controller.long}\naddress is ${controller.currentaddress}")
                  : SizedBox()
            ],
          ),
        ));
      },
    );
  }
}
