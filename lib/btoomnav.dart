import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  homecontroller controller = Get.put(homecontroller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text("page ${controller.indexes}"),
          ),
          bottomNavigationBar: bottomnavbar(),
        );
      },
    );
  }

  bottomnavbar() {
    return BottomNavigationBar(
      currentIndex: controller.indexes,
      items: [
        BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage("assets/ticket 2.png")),
            icon: ImageIcon(AssetImage("assets/calendar.png")),
            label: "-"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/Icon awesome-user.png")),
            label: "_"),
      ],
      onTap: controller.indexchange,
      selectedIconTheme: IconThemeData(color: Colors.blue, size: 28, shadows: [
        Shadow(color: Colors.green, offset: Offset(0, 5), blurRadius: 5),
        Shadow(color: Colors.yellow, offset: Offset(5, 0), blurRadius: 7)
      ]),
      unselectedIconTheme: IconThemeData(color: Colors.red, size: 22),
    );
  }
}

class homecontroller extends GetxController {
  int indexes = 0;
  indexchange(i) {
    indexes = i;
    update();
  }
}
