// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:textos/pages/chatpage.dart';
import 'package:textos/pages/notificationpage.dart';
import 'package:textos/pages/profilepage.dart';

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

  TextEditingController postController = TextEditingController();

  int currentPage = 0;

  void getFeed() async {
    var response = await dio.get("https://jsonplaceholder.typicode.com/users");
    users = response.data;
    users.add(users);
    var response2 = await dio.get("https://jsonplaceholder.typicode.com/posts");
    posts = response2.data;
    setState(() {});
  }

  List news = [];
  bool gotNews = false;
  void getNews() async {
    var url =
        "https://genapifortextos.onrender.com/news/headlines/technology/us";
    var response = await dio.get(url);
    news = response.data["articles"];
    gotNews = true;
    setState(() {});
  }

  bool gotWeather = false;
  Map weather = {
    "location": {
      "name": " ",
    },
    "current": {
      "temp_c": " ",
      "condition": {
        "icon": " ",
      },
    }
  };
  Future<void> getWeather() async {
    var url =
        "https://genapifortextos.onrender.com/weather/forecast/addis ababa/5";
    var response = await dio.get(url);
    weather = response.data;
    gotWeather = true;
    setState(() {});
  }

  double? latitude = 0.0;
  double? longitude = 0.0;
  loc.LocationData? curLocation;
  void getLocation() async {
    loc.Location location = loc.Location();
    await location.requestPermission();
    curLocation = await location.getLocation();
    latitude = curLocation!.latitude;
    longitude = curLocation!.longitude;
    await getWeather();
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
    getNews();
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
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
                                              Text(
                                                " — more",
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 13.0,
                                                ),
                                              ),
                                            ],
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
                                      SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Text(
                                            "like",
                                            style: TextStyle(
                                              color: Colors.grey[600]!,
                                              fontSize: 15.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 20.0),
                                          Text(
                                            "comment",
                                            style: TextStyle(
                                              color: Colors.grey[600]!,
                                              fontSize: 15.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 20.0),
                                          Text(
                                            "repost",
                                            style: TextStyle(
                                              color: Colors.grey[600]!,
                                              fontSize: 15.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 20.0),
                                          Text(
                                            "save",
                                            style: TextStyle(
                                              color: Colors.grey[600]!,
                                              fontSize: 15.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
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
                                              Text(
                                                " — more",
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 13.0,
                                                ),
                                              ),
                                            ],
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
                                      SizedBox(height: 10.0),
                                      Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "like",
                                            style: TextStyle(
                                              color: Colors.grey[600]!,
                                              fontSize: 15.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 20.0),
                                          Text(
                                            "comment",
                                            style: TextStyle(
                                              color: Colors.grey[600]!,
                                              fontSize: 15.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 20.0),
                                          Text(
                                            "repost",
                                            style: TextStyle(
                                              color: Colors.grey[600]!,
                                              fontSize: 15.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 20.0),
                                          Text(
                                            "save",
                                            style: TextStyle(
                                              color: Colors.grey[600]!,
                                              fontSize: 15.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              SizedBox(height: 200.0)
                            ],
                          ),
                          ListView(
                            children: [
                              Container(
                                // height: 100.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${weather["current"]["condition"]["text"]} degrees",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.0,
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${weather["location"]["name"]}, ",
                                                  style: TextStyle(
                                                    color: Colors.grey[500]!,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 5.0),
                                                Text(
                                                  weather["location"]["country"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black,
                                          child: Text(
                                            "${weather["current"]["temp_c"]} °",
                                            style: TextStyle(
                                              fontSize: 35.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    gotWeather == false
                                        ? Container()
                                        : Container(
                                            height: 200.0,
                                            child: ListView(
                                              children: [
                                                for (var i
                                                    in weather["forecast"]
                                                            ["forecastday"][0]
                                                        ["hour"])
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        i["time"]
                                                            .toString()
                                                            .substring(11),
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600]!,
                                                        ),
                                                      ),
                                                      Text(
                                                        i["condition"]["text"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[500]!,
                                                        ),
                                                      ),
                                                      Text(
                                                        i["temp_c"]
                                                            .toString()
                                                            .padRight(3, ".0"),
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600]!,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                    gotNews == false
                                        ? Container()
                                        : Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 25.0),
                                                Text(
                                                  "Trending".toString(),
                                                  style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[600]!,
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                                for (var i in news)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 30.0,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          i["title"].toString(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5.0),
                                                        Text(
                                                          i["description"]
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[600]!,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5.0),
                                                        Text(
                                                          i["author"]
                                                                  .toString() +
                                                              " — " +
                                                              i["publishedAt"]
                                                                  .toString()
                                                                  .substring(
                                                                      00, 10),
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .grey[600]!,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
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
                  ? NotificationPage(
                      bottomNavBar: bottomNavBar,
                    )
                  : currentPage == 3
                      ? ProfilePage(
                          bottomNavBar: bottomNavBar,
                        )
                      : Scaffold(
                          appBar: AppBar(
                            title: Text(
                              "post",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          body: Container(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                controller: postController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                decoration: InputDecoration(
                                    hintText: "type message...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600]!,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          bottomNavigationBar: bottomNavBar,
                        ),
    );
  }
}
