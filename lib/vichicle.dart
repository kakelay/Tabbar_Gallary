import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class Vehicle {
  final String imageUrl;

  Vehicle({required this.imageUrl});
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Vehicle> activeVehicleList = [
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
    Vehicle(imageUrl: "https://via.placeholder.com/300"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: activeVehicleList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.close,
              color: Colors.amber,
            ),
          ),
          Gap(8)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: activeVehicleList
            .map((vehicle) => Center(
                  child: Image.network(
                    vehicle.imageUrl,
                    width: 350,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ))
            .toList(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 20),
        height: 100,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: activeVehicleList
              .map((vehicle) => Center(
                    child: Image.network(
                      vehicle.imageUrl,
                      width: 100,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
