// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class DirectMessagePage extends StatefulWidget {
  const DirectMessagePage({
    super.key,
    required this.message,
  });

  final Map message;

  @override
  State<DirectMessagePage> createState() => _DirectMessagePageState();
}

class _DirectMessagePageState extends State<DirectMessagePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int currentPage = 0;
  int pageIndex = 0;
  var me = "dagmawibabi";
  TextEditingController messageController = TextEditingController();

  List sampleDM = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(() {
      pageIndex = tabController!.index;
      setState(() {});
    });
    sampleDM = [
      {
        "name": me,
        "text": "Hey, how are you?",
      },
      {
        "name": widget.message["name"],
        "text": "Hey, I'm doing good, loving this app!",
      },
      {
        "name": me,
        "text": "Thank means a lot! <3",
      },
      {
        "name": widget.message["name"],
        "text": "Wyd next saturday?",
      },
      {
        "name": me,
        "text": "The usual uk, here and there",
      },
      {
        "name": widget.message["name"],
        "text": widget.message["text"],
      },
    ];
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
    TextStyle primaryActionBottomNavbarTextStyle = TextStyle(
      color: Colors.grey[500]!,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
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
                "text",
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
                "voice",
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
              child: Text(
                "camera",
                style: currentPage == 2
                    ? activeBottomNavbarTextStyle
                    : inActiveBottomNavbarTextStyle,
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
                "file",
                style: currentPage == 3
                    ? activeBottomNavbarTextStyle
                    : inActiveBottomNavbarTextStyle,
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (currentPage == 0) {
                var curMessage = {
                  "name": me,
                  "text": messageController.text.trim(),
                };
                sampleDM.add(curMessage);
                messageController.clear();
              }
              setState(() {});
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
              child: Text(
                "send",
                style: primaryActionBottomNavbarTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

    return SafeArea(
      child: DefaultTabController(
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
                            child: Text("chat"),
                          ),
                          Text(
                            "profile",
                          ),
                          Container(
                            width: 120.0,
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
                height: MediaQuery.of(context).size.height * 0.735,
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView(
                      children: [
                        Column(
                          children: [
                            for (var i in sampleDM)
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
                                child: Row(
                                  mainAxisAlignment: i["name"] == me
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 230.0,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 1.0),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.0,
                                        vertical: 10.0,
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: i["name"] ==
                                                      me
                                                  ? CrossAxisAlignment.end
                                                  : CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      i["name"] == me
                                                          ? MainAxisAlignment
                                                              .end
                                                          : MainAxisAlignment
                                                              .start,
                                                  children: [
                                                    Text(
                                                      i["name"]
                                                          .toString()
                                                          .toLowerCase(),
                                                      style: TextStyle(
                                                        color:
                                                            Colors.grey[600]!,
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5.0),
                                                Text(
                                                  i["text"]
                                                      .toString()
                                                      .toLowerCase(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                SizedBox(height: 6.0),
                                                Text(
                                                  "${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}",
                                                  style: TextStyle(
                                                    color: Colors.grey[600]!,
                                                    fontSize: 12.0,
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
              currentPage == 0
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: messageController,
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
                    )
                  : Container(),
            ],
          ),
          bottomNavigationBar: pageIndex == 0 ? bottomNavBar : BottomAppBar(),
        ),
      ),
    );
  }
}
