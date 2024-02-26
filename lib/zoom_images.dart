import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class Vehicle {
  final String imageUrl;

  Vehicle({required this.imageUrl});
}

class ZoomImages extends StatefulWidget {
  @override
  _ZoomImagesState createState() => _ZoomImagesState();
}

class _ZoomImagesState extends State<ZoomImages>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Vehicle> activeVehicleList = [
    Vehicle(
        imageUrl:
            "https://cf.bstatic.com/xdata/images/hotel/max1024x768/330480570.jpg?k=8c95e6bc4e9896d0316bc6053f383ea074ba1df00fd09587d4c8bb43bdc3d054&o=&hp=1"),
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
    Vehicle(
        imageUrl:
            "https://nunne.ee/wp-content/uploads/2023/08/intro2-1430x720.jpeg"),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      vehicle.imageUrl,
                      width: 350,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            .toList(),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 100,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelPadding: const EdgeInsets.only(right: 8),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          tabs: activeVehicleList
              .map((vehicle) => Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        vehicle.imageUrl,
                        width: 100,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
