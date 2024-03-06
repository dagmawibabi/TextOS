// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
    required this.bottomNavBar,
  });

  final BottomAppBar bottomNavBar;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List sampleLikeNotifications = [
    {
      "name": "dagmawibabi",
      "new": true,
    },
    {
      "name": "akinahom",
      "new": false,
    },
    {
      "name": "powertag",
      "new": true,
    },
    {
      "name": "dagmawibabi",
      "new": true,
    },
    {
      "name": "akinahom",
      "new": false,
    },
    {
      "name": "powertag",
      "new": true,
    },
    {
      "name": "dagmawibabi",
      "new": false,
    },
    {
      "name": "akinahom",
      "new": true,
    },
    {
      "name": "powertag",
      "new": false,
    },
  ];
  List sampleCommentNotifications = [
    {
      "name": "dagmawibabi",
      "text": "gd ia idgi agdfi idiaug iudia diu",
      "new": false,
    },
    {
      "name": "akinahom",
      "text": "gdiuh a idua uida igiu",
      "new": true,
    },
    {
      "name": "powertag",
      "text": "adkhh iiudga dgdgfai dig idga digdig igaig idaidgi gdigd aiadg.",
      "new": false,
    },
    {
      "name": "dagmawibabi",
      "text": "gd ia idgi agdfi idiaug iudia diu",
      "new": true,
    },
    {
      "name": "akinahom",
      "text": "gdiuh a idua uida igiu",
      "new": false,
    },
  ];
  List sampleRepostNotifications = [
    {
      "name": "dagmawibabi",
      "new": false,
    },
    {
      "name": "akinahom",
      "new": true,
    },
    {
      "name": "powertag",
      "new": false,
    },
    {
      "name": "dagmawibabi",
      "new": true,
    },
    {
      "name": "akinahom",
      "new": false,
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                          child: Text("likes"),
                        ),
                        Text("comments"),
                        Text("reposts"),
                        Container(
                          color: Colors.black,
                          margin: const EdgeInsets.only(left: 40.0),
                          child: Text("settings"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: TabBarView(
                controller: tabController,
                children: [
                  Column(
                    children: [
                      for (var i in sampleLikeNotifications)
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 8.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            i["name"].toString().toLowerCase(),
                                            style: TextStyle(
                                              color: i["new"] == true
                                                  ? Colors.grey[400]!
                                                  : Colors.grey[700]!,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Text(
                                            " liked your new post.",
                                            style: TextStyle(
                                              color: i["new"] == true
                                                  ? Colors.grey[400]!
                                                  : Colors.grey[700]!,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}",
                                        style: TextStyle(
                                          color: i["new"] == true
                                              ? Colors.grey[400]!
                                              : Colors.grey[700]!,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  // color: Colors.red,
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    i["new"] == true ? "•" : "",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      for (var i in sampleCommentNotifications)
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                i["name"]
                                                    .toString()
                                                    .toLowerCase(),
                                                style: TextStyle(
                                                  color: i["new"] == true
                                                      ? Colors.grey[400]!
                                                      : Colors.grey[700]!,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                " commented on your new post.",
                                                style: TextStyle(
                                                  color: i["new"] == true
                                                      ? Colors.grey[400]!
                                                      : Colors.grey[700]!,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            "${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}",
                                            style: TextStyle(
                                              color: i["new"] == true
                                                  ? Colors.grey[400]!
                                                  : Colors.grey[700]!,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 15.0,
                                      // color: Colors.red,
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        i["new"] == true ? "•" : "",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "" + i["text"],
                                  style: TextStyle(
                                    color: i["new"] == true
                                        ? Colors.grey[400]!
                                        : Colors.grey[700]!,
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
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      for (var i in sampleRepostNotifications)
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 8.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            i["name"].toString().toLowerCase(),
                                            style: TextStyle(
                                              color: i["new"] == true
                                                  ? Colors.grey[400]!
                                                  : Colors.grey[700]!,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Text(
                                            " reposted your new post.",
                                            style: TextStyle(
                                              color: i["new"] == true
                                                  ? Colors.grey[400]!
                                                  : Colors.grey[700]!,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}",
                                        style: TextStyle(
                                          color: i["new"] == true
                                              ? Colors.grey[400]!
                                              : Colors.grey[700]!,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  // color: Colors.red,
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    i["new"] == true ? "•" : "",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "SETTINGS",
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
        bottomNavigationBar: widget.bottomNavBar,
      ),
    );
  }
}
