import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:myapp/colors.dart' as color;
import 'package:myapp/pages/_banks.dart';
import 'package:myapp/pages/_blogDetail.dart';
import 'package:myapp/pages/_blogsList.dart';
import 'package:myapp/pages/_categoryList.dart';
import 'package:myapp/pages/_joblist.dart';
import 'package:myapp/pages/_latestNews.dart';
import 'package:myapp/pages/_manPowerDetail.dart';
import 'package:myapp/pages/_manPowerList.dart';
import 'package:myapp/pages/_newsDetail.dart';
import 'package:myapp/pages/_noticeDetail.dart';
import 'package:myapp/pages/jobDetail.dart';
import 'package:myapp/pages/noticeList.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  final SwiperController _controller = SwiperController();
  final int _pageCount = 3;
  int _currentIndex = 0;
  final List<String> titles = [
    "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
    "Aliquam eget justo \n nec arcu ultricies elementum \n id at metus. ",
    "Nulla facilisi. \nFusce non tempus risus.\n Sed ultrices scelerisque sem,"
  ];
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.bg,
      appBar: AppBar(
        backgroundColor: color.primary,
        actions: <Widget>[
          // Bell Icon
          IconButton(
            icon: FaIcon(FontAwesomeIcons.globe),
            iconSize: 20,
            onPressed: () {},
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.userCircle),
            iconSize: 20,
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        bottom: _buildBottomBar(),
      ),
      drawer: _buildDrawer(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: color.secondary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                                color: color.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => categoryList(),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                border: Border.all(color: color.primary)),
                            child: Text(
                              'SEE ALL',
                              style:
                                  TextStyle(color: color.primary, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Category
                    Container(
                      // color: color.secondary,
                      width: double.infinity,
                      height: 110,
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return _categoryList(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => bankLists(),
                      ));
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.fromLTRB(18, 0, 12, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              color: Colors.grey.withOpacity(.5),
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.moneyBillWave,
                            color: Colors.orange,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              'Bank',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Colors.grey.withOpacity(.5),
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.handHoldingMedical,
                          color: Colors.redAccent,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Medical',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Colors.grey.withOpacity(.5),
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.handHoldingHeart,
                          color: Colors.green,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Insurance',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Colors.grey.withOpacity(.5),
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.chalkboardTeacher,
                          color: Colors.lime,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Orientation',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              // Recently Added Job Start
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 18),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                          color: color.primary,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Text(
                        'Recently Added Job',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => JobList(),
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: color.primary)),
                      child: Text(
                        'SEE ALL',
                        style: TextStyle(color: color.primary, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),

              Card(
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: color.secondary,
                child: InkWell(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => JobPage()))
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 18),
                        height: 80,
                        width: 100,
                        child: Image.asset('images/job.jpg'),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hotel & Resturant',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Company Name',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 2.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.mapMarkerAlt,
                                              size: 12,
                                            ),
                                          ),
                                          Text(
                                            'Nepal, Kathmandu',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 2.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.clock,
                                                size: 12,
                                              ),
                                            ),
                                            Text(
                                              '2 hrs, 30 min',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.star)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Card(
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: color.secondary,
                child: InkWell(
                  onTap: () => {},
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 18),
                        height: 80,
                        width: 100,
                        child: Image.asset('images/job.jpg'),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hotel & Resturant',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Company Name',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 2.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.mapMarkerAlt,
                                              size: 12,
                                            ),
                                          ),
                                          Text(
                                            'Nepal, Kathmandu',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 2.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.clock,
                                                size: 12,
                                              ),
                                            ),
                                            Text(
                                              '2 hrs, 30 min',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.star)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    child: TabBar(
                      tabs: [
                        Tab(
                          text: "Manpower",
                        ),
                        Tab(text: "Embassy")
                      ],
                      indicatorColor: color.primary,
                      labelColor: color.primary,
                      controller: _tabController,
                    ),
                  ),
                  Container(
                    height: 220,
                    child: TabBarView(controller: _tabController, children: <
                        Widget>[
                      Container(
                        child: Column(
                          children: [
                            Card(
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              child: InkWell(
                                onTap: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => manPowerDetail(),
                                  ))
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 18),
                                      height: 80,
                                      width: 100,
                                      child: Image.asset('images/hotel.jpg'),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 15),
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'The River Overseas Pvt. Ltd',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        // height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              color.secondary,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 4),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          2.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .mapMarkerAlt,
                                                                size: 12,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Nepal, Kathmandu',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              color.secondary,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            left: 8),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 4),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          2.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .phoneSquareAlt,
                                                                size: 12,
                                                              ),
                                                            ),
                                                            Text(
                                                              '2 hrs ago',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                            Card(
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              child: InkWell(
                                onTap: () => {},
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 18),
                                      height: 80,
                                      width: 100,
                                      child: Image.asset('images/hotel.jpg'),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 15),
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'The River Overseas Pvt. Ltd',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        // height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              color.secondary,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 4),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          2.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .mapMarkerAlt,
                                                                size: 12,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Nepal, Kathmandu',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              color.secondary,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            left: 8),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 4),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          2.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .phoneSquareAlt,
                                                                size: 12,
                                                              ),
                                                            ),
                                                            Text(
                                                              '2 hrs ago',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => manPowers(),
                                ));
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      border: Border.all(
                                        color: color.primary,
                                      )),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SEE ALL',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.arrowAltCircleRight,
                                        size: 18,
                                        color: Colors.grey[500],
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text("sign up"),
                      )
                    ]),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: color.primary,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: FaIcon(
                                FontAwesomeIcons.bullhorn,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Text('LT Number',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    OutlineButton(
                      borderSide: BorderSide(color: color.primary),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 14),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: FaIcon(
                                FontAwesomeIcons.idCard,
                                color: color.primary,
                                size: 14,
                              ),
                            ),
                            Text('Work Permit',
                                style: TextStyle(
                                  color: color.primary,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // End button

              // Start Latest News
              // Recently Added Job Start
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 18),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                          color: color.primary,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Text(
                        'Latest News',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => latestNews(),
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: color.primary)),
                      child: Text(
                        'SEE ALL',
                        style: TextStyle(color: color.primary, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: color.bg,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => newsDetail(),
                      )),
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Government looks for more loans',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'While the government response to the virus has not been up to the mark, it has also failed to ensure risk communication and make...',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 2.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.asterisk,
                                            color: Colors.grey,
                                            size: 12,
                                          ),
                                        ),
                                        Text(
                                          'ekantipur.com',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 2.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.clock,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                          ),
                                          Text(
                                            '30 min ago',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        _buildThumbnail(),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: color.bg,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Government looks for more loans',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'While the government response to the virus has not been up to the mark, it has also failed to ensure risk communication and make...',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 2.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.asterisk,
                                            color: Colors.grey,
                                            size: 12,
                                          ),
                                        ),
                                        Text(
                                          'ekantipur.com',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 2.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.clock,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                          ),
                                          Text(
                                            '30 min ago',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        _buildThumbnail(),
                      ],
                    ),
                  ),
                ),
              ),
              // End News section

              // Start Notice
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 18),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                          color: color.primary,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Text(
                        'Notices',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => noticeList(),
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: color.primary)),
                      child: Text(
                        'SEE ALL',
                        style: TextStyle(color: color.primary, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: color.bg,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => noticeDetail(),
                      )),
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Health workers under attack as lack of nder attack as lack of',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'While the government response to the virus has not been up to the mark, it has also failed to ensure risk communication and make...',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '26 July, 2020',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.angleDoubleRight,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: color.bg,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Health workers under attack as lack of nder attack as lack of',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'While the government response to the virus has not been up to the mark, it has also failed to ensure risk communication and make...',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '26 July, 2020',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.angleDoubleRight,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // End notice
              // Start Blog section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 18),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                          color: color.primary,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Text(
                        'Blogs',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => blogLists(),
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: color.primary)),
                      child: Text(
                        'SEE ALL',
                        style: TextStyle(color: color.primary, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 420,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return _buildBlog(context);
              },
              index: _currentIndex,
              loop: false,
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey, activeColor: color.primary)),
              controller: _controller,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildNavBar(),
    );
  }
}

Widget _buildBlog(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => blogDetail(),
      ));
    },
    child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/hotel.jpg',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'I can’t think of any use ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: FaIcon(
                          FontAwesomeIcons.user,
                          color: Colors.grey,
                          size: 12,
                        ),
                      ),
                      Text('Rolling Plans',
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.clock,
                            color: Colors.grey,
                            size: 12,
                          ),
                        ),
                        Text('26 july, 2020',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Honestly, I can’t think of any use cases where you might want to use Min setting. I have never used this setting myself. I did try to use in nested Columns and Rows but it doesn’t really work as you expect it to, Min is completely ignored in nested Columns and Rows because you will use Expanded widget which will force the children to as big as possible. ',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        )),
  );
}

Container _buildThumbnail() {
  return Container(
    padding: EdgeInsets.only(left: 18),
    height: 90,
    width: 100,
    child: Image.asset('images/kantipur-2.jpg'),
  );
}

Widget _categoryList(BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        Container(
          height: 60,
          width: 60,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: CircleAvatar(
            backgroundColor: color.primary,
            maxRadius: 30,
            child: FaIcon(
              FontAwesomeIcons.home,
              color: Colors.white,
            ),
          ),
        ),
        Text('Hotel')
      ],
    ),
  );
}

PreferredSize _buildBottomBar() {
  return PreferredSize(
    child: Container(
      decoration: BoxDecoration(
          color: color.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
              'Find Your Job',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new DropdownButton<String>(
                    hint: Text('County'),
                    items: <String>['Nepal', 'India', 'China', 'UK']
                        .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  new DropdownButton<String>(
                    hint: Text('Full Time'),
                    items: <String>['Nepal', 'India', 'China', 'UK']
                        .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  new DropdownButton<String>(
                    hint: Text('Freelance'),
                    items: <String>['Nepal', 'India', 'China', 'UK']
                        .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    preferredSize: Size.fromHeight(100.0),
  );
}

Widget _buildNavBar() {
  return BottomNavigationBar(
    selectedItemColor: color.primary,
    unselectedItemColor: Colors.grey,
    currentIndex: 0,
    showUnselectedLabels: false,
    onTap: (i) {},
    items: [
      BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.home,
        ),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.shoppingBag),
        title: Text('Jobs'),
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.newspaper),
        title: Text('News'),
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.bell),
        title: Text('Notification'),
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.ellipsisV),
        title: Text('More'),
      ),
    ],
  );
}

class _buildDrawer extends StatelessWidget {
  const _buildDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: [
          DrawerHeader(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 90,
              alignment: Alignment.centerLeft,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/user.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('Prajwal Rai',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: color.primary,
              // image: DecorationImage(
              //     fit: BoxFit.cover, image: AssetImage('images/blog.jpg'))
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              color: color.secondary,
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.home,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Home',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.building,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Manpowers',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.moneyBillWave,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Money Exchange Rate',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.newspaper,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('News',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.globe,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Languages',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.userCircle,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Profile',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.bell,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Notifications',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.questionCircle,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('FAQ',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.phoneSquareAlt,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Contact Us',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.exclamationCircle,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('About Us',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.powerOff,
                    size: 16,
                    color: color.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Log Out',
                        style: TextStyle(fontSize: 16, color: color.primary)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
