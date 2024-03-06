// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:textos/pages/directMessagePage.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.bottomNavBar});

  final BottomAppBar bottomNavBar;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List sampleChats = [
    {
      "name": "dagmawibabi",
      "text": "Loriagui aigd digagu akd ioudag hiagdi gdigia.",
      "new": false,
    },
    {
      "name": "akinahom",
      "text": "agu akd ioudag hiagdi gdigia.",
      "new": true,
    },
    {
      "name": "powertag",
      "text": "dabs udag hiagdi gdigia.",
      "new": false,
    },
    {
      "name": "cyberpunk",
      "text": "igia afh adhgad agda 9dag d idi agdig i adiii gdagi aidg.",
      "new": true,
    },
    {
      "name": "keruptos",
      "text":
          "aiufd diuah aiudg o agida iu giuadiuag id igua dig uad udag hiagdi gdigia.",
      "new": true,
    },
    {
      "name": "sopthhad",
      "text": "igia afh adhgad agda 9dag d idi agdig i adiii gdagi aidg.",
      "new": false,
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                          child: Text("chats"),
                        ),
                        Text("groups"),
                        Container(
                          color: Colors.black,
                          margin: const EdgeInsets.only(left: 130.0),
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
                      for (var i in sampleChats)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DirectMessagePage(
                                  message: i,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 10.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            i["name"].toString().toLowerCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
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
                                        i["text"].toString().toLowerCase(),
                                        style: TextStyle(
                                          color: i["new"] == true
                                              ? Colors.grey[500]!
                                              : Colors.grey[700]!,
                                          fontSize: 15.0,
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
                      "GROUPS",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
