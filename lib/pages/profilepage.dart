// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.bottomNavBar,
  });

  final BottomAppBar bottomNavBar;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List samplePosts = [
    {
      "name": "dagmawibabi",
      "text": "daugu iaidua iudaiudiuiu dgiugiadug idguiuda.",
    },
    {
      "name": "dagmawibabi",
      "text": "daugu iaidua iudaiudiuiu dgiugiadug idguiuda.",
    },
    {
      "name": "dagmawibabi",
      "text": "daugu iaidua iudaiudiuiu dgiugiadug idguiuda.",
    },
    {
      "name": "dagmawibabi",
      "text": "daugu iaidua iudaiudiuiu dgiugiadug idguiuda.",
    },
    {
      "name": "dagmawibabi",
      "text": "daugu iaidua iudaiudiuiu dgiugiadug idguiuda.",
    },
    {
      "name": "dagmawibabi",
      "text": "daugu iaidua iudaiudiuiu dgiugiadug idguiuda.",
    },
    {
      "name": "dagmawibabi",
      "text": "daugu iaidua iudaiudiuiu dgiugiadug idguiuda.",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                          child: Text("profile"),
                        ),
                        Container(
                          color: Colors.black,
                          margin: const EdgeInsets.only(left: 220.0),
                          child: Text("settings"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Dagmawi Babi",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Text(
                                  " — dagmawibabi",
                                  style: TextStyle(
                                    color: Colors.grey[600]!,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Believer | CEO @DreamIntell",
                              style: TextStyle(
                                color: Colors.grey[500]!,
                                // fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "t.me/dagmawi_babi",
                              style: TextStyle(
                                color: Colors.grey[500]!,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "128",
                                      style: TextStyle(
                                        color: Colors.grey[400]!,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "posts",
                                      style: TextStyle(
                                        color: Colors.grey[700]!,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "12.6K",
                                      style: TextStyle(
                                        color: Colors.grey[400]!,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "followers",
                                      style: TextStyle(
                                        color: Colors.grey[700]!,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "476",
                                      style: TextStyle(
                                        color: Colors.grey[400]!,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "following",
                                      style: TextStyle(
                                        color: Colors.grey[700]!,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "1.2M",
                                      style: TextStyle(
                                        color: Colors.grey[400]!,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "likes",
                                      style: TextStyle(
                                        color: Colors.grey[700]!,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 35.0),
                            Text(
                              "Posts".toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]!,
                              ),
                            ),
                            for (var i = 0; i < samplePosts.length - 1; i++)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                margin: EdgeInsets.only(bottom: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 5.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              samplePosts[i]["name"]
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
                                      samplePosts[i]["text"]
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
                            SizedBox(height: 200.0),
                          ],
                        ),
                      ],
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
