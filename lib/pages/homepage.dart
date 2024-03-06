// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:textos/pages/chatpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  Dio dio = Dio();
  List users = [];
  List posts = [];
  List feed = [];

  int currentPage = 0;

  void getFeed() async {
    var response = await dio.get("https://jsonplaceholder.typicode.com/users");
    users = response.data;
    users.add(users);
    var response2 = await dio.get("https://jsonplaceholder.typicode.com/posts");
    posts = response2.data;
    setState(() {});
  }

  var weather = "";
  void getWeather() async {
    var response = await dio.get(
        "https://genapifortextos.onrender.com/weather/forecast$latitude/$longitude");
    weather = response.data;
    print(weather);
    setState(() {});
  }

  double? latitude = 0.0;
  double? longitude = 0.0;
  void getLocation() async {
    loc.Location location = loc.Location();
    await location.requestPermission();
    loc.LocationData curLocation = await location.getLocation();
    latitude = curLocation.latitude;
    longitude = curLocation.longitude;
  }

  void askPermission() async {
    // PermissionStatus abc =
    await Permission.location.request();
  }

  // initState
  @override
  void initState() {
    askPermission();
    getLocation();
    getFeed();
    tabController = TabController(length: 3, vsync: this);
    // tabController.index = 1;
    // tabController.addListener(() {
    //   pageIndex = tabController.index;
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle activeBottomNavbarTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
    TextStyle inActiveBottomNavbarTextStyle = TextStyle(
      color: Colors.grey[600]!,
      fontSize: 16.0,
    );
    // TextStyle primaryActionBottomNavbarTextStyle = TextStyle(
    //   color: Colors.white,
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.bold,
    // );

    BottomAppBar bottomNavBar = BottomAppBar(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              currentPage = 0;
              setState(() {});
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
              child: Text(
                "home",
                style: currentPage == 0
                    ? activeBottomNavbarTextStyle
                    : inActiveBottomNavbarTextStyle,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              currentPage = 1;
              setState(() {});
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
              child: Text(
                "chat",
                style: currentPage == 1
                    ? activeBottomNavbarTextStyle
                    : inActiveBottomNavbarTextStyle,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              currentPage = 2;
              setState(() {});
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
              child: Row(
                children: [
                  Text(
                    "new",
                    style: currentPage == 2
                        ? activeBottomNavbarTextStyle
                        : inActiveBottomNavbarTextStyle,
                  ),
                  Text(
                    " •",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              currentPage = 3;
              setState(() {});
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
              child: Text(
                "profile",
                style: currentPage == 3
                    ? activeBottomNavbarTextStyle
                    : inActiveBottomNavbarTextStyle,
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              currentPage = 4;
              setState(() {});
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
              child: Text(
                "write",
                style: currentPage == 4
                    ? activeBottomNavbarTextStyle
                    : inActiveBottomNavbarTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
    return SafeArea(
        child: currentPage == 0
            ? DefaultTabController(
                length: 3,
                child: Scaffold(
                  body: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 70.0,
                              // color: Colors.red,
                              child: TabBar(
                                controller: tabController,
                                indicatorColor: Colors.transparent,
                                // indicatorWeight: 1.0,
                                // indicatorColor: Colors.greenAccent.withOpacity(0.4),
                                // indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                                // indicatorSize: TabBarIndicatorSize.label,
                                unselectedLabelColor: Colors.grey[600]!,
                                unselectedLabelStyle: TextStyle(
                                  fontSize: 16.0,
                                ),
                                dividerColor: Colors.black,
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                tabs: [
                                  Container(
                                    color: Colors.black,
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text("for you"),
                                  ),
                                  Text("following"),
                                  Container(
                                    color: Colors.black,
                                    margin: const EdgeInsets.only(left: 130.0),
                                    child: Text("search"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.84,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            ListView(
                              children: [
                                for (var i = 0; i < users.length - 1; i++)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 25.0,
                                      vertical: 10.0,
                                    ),
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              users[i]["username"]
                                                  .toString()
                                                  .toLowerCase(),
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            Text(
                                              " — ${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}",
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          posts[i]["title"]
                                              .toString()
                                              .toLowerCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                SizedBox(height: 200.0)
                              ],
                            ),
                            ListView(
                              children: [
                                for (var i = 0; i < users.length - 1; i++)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 25.0,
                                      vertical: 10.0,
                                    ),
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              users[i]["username"]
                                                  .toString()
                                                  .toLowerCase(),
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            Text(
                                              " — ${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}",
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          posts[i + 50]["title"]
                                              .toString()
                                              .toLowerCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                SizedBox(height: 200.0)
                              ],
                            ),
                            Center(
                              child: Text(
                                "SEARCH",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: bottomNavBar,
                ),
              )
            : currentPage == 1
                ? ChatPage(
                    bottomNavBar: bottomNavBar,
                  )
                : currentPage == 2
                    ? Scaffold(
                        body: Center(
                          child: Text(
                            "NEW",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        bottomNavigationBar: bottomNavBar,
                      )
                    : Scaffold(
                        body: Center(
                          child: Text(
                            "PROFILE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        bottomNavigationBar: bottomNavBar,
                      ));
  }
}
