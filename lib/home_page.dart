import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:practice/contact_page.dart';
import 'package:practice/send_money_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoaded = false;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    // make _isLoaded true after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161621),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.blueGrey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.blueGrey,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          color: const Color(0xff161621),
          child: ListTileTheme(
            textColor: Colors.blueGrey,
            iconColor: Colors.blueGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 80.0,
                    height: 80.0,
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 24.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/avatar-1.png')
                ),
                const SizedBox(height: 10,),
                const  Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text("John Doe",
                    style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600),),
                ),
                const Spacer(),
                const Divider(color: Colors.blueGrey,),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Iconsax.home),
                  title: const Text('Dashboard'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const  Icon(Iconsax.chart_2),
                  title: const Text('Analytics'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ContactsScreen()));
                  },
                  leading:const  Icon(Iconsax.profile_2user),
                  title: const Text('Contacts'),
                ),
                const SizedBox(height: 50,),
                Divider(color: Colors.grey.shade800),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Iconsax.setting_2),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Iconsax.support),
                  title: const Text('Support'),
                ),
                const Spacer(),
                const Padding(
                  padding:  EdgeInsets.all(20.0),
                  child: Text('Version 1.0.0', style: TextStyle(color: Colors.blueGrey),),
                )
              ],
            ),
          ),
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            FadeInUp(
                                duration: const Duration(milliseconds: 800),
                                child: Text(
                                  "Balance",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade300,
                                      fontSize: 20),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeInUp(
                              duration: const Duration(milliseconds: 800),
                              child: Text(
                                "\$ 12,500.00",
                                style: GoogleFonts.sora(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: LineChart(
                            mainData(),
                            swapAnimationDuration:
                                const Duration(milliseconds: 1000), // Optional
                            swapAnimationCurve: Curves.linear, // Optional
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FadeInUp(
                duration:const  Duration(milliseconds: 1000),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: const Color(0xff02d39a).withOpacity(0.7),
                      child: Row(
                        children: const [
                          Icon(
                            Iconsax.wallet,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Payment",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const TransferMoney(name: 'Isaac Pitwa',avatar: 'assets/images/avatar-1.png',)),);
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color(0xff02d39a).withOpacity(0.4),
                              width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      splashColor: const Color(0xff02d39a).withOpacity(0.4),
                      highlightColor: const Color(0xff02d39a).withOpacity(0.4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      color: Colors.transparent,
                      elevation: 0,
                      child: Row(
                        children: const [
                          Icon(
                            Iconsax.arrow_3,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Transfer",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // recent transactions
              FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    "Recent Transactions",
                    style: TextStyle(
                        color: Colors.blueGrey.shade300, fontSize: 16),
                  )),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child:  SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return FadeInUp(
                        from: 50,
                        duration: Duration(milliseconds: 1000 + index * 100),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.black.withOpacity(0.3),
                              border: Border.all(
                                  color: Colors.blueGrey.withOpacity(0.3),
                                  width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Iconsax.arrow_3,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Transfer",
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "\$ 12,500.00",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "12:00 PM",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
          )),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        margin: const EdgeInsets.only(bottom: 30, top: 10, right: 20, left: 20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.white),
          SalomonBottomBarItem(
              icon: const Icon(Icons.explore_outlined),
              title: const Text("Likes"),
              selectedColor: Colors.pink),
          SalomonBottomBarItem(
              icon: const Icon(Icons.data_usage),
              title: const Text("Search"),
              selectedColor: Colors.orange),
          SalomonBottomBarItem(
              icon: const Icon(Icons.settings),
              title: const Text("Profile"),
              selectedColor: Colors.teal)
        ],
      ),
    );
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: true,
          horizontalInterval: 1.6,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              dashArray: const [3, 3],
              color: const Color(0xff37434d).withOpacity(0.2),
              strokeWidth: 2,
            );
          },
          drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 11),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'MAR';
              case 4:
                return 'JUN';
              case 8:
                return 'SEP';
              case 11:
                return 'OCT';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded
              ? [
                  const FlSpot(0, 3),
                  const FlSpot(2.4, 2),
                  const FlSpot(4.4, 3),
                  const FlSpot(6.4, 3.1),
                  const FlSpot(8, 4),
                  const FlSpot(9.5, 4),
                  const FlSpot(11, 5),
                ]
              : [
                  const FlSpot(0, 0),
                  const FlSpot(2.4, 0),
                  const FlSpot(4.4, 0),
                  const FlSpot(6.4, 0),
                  const FlSpot(8, 0),
                  const FlSpot(9.5, 0),
                  const FlSpot(11, 0)
                ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradientFrom: const Offset(0, 0),
              gradientTo: const Offset(0, 1),
              colors: [
                const Color(0xff02d39a).withOpacity(0.1),
                const Color(0xff02d39a).withOpacity(0),
              ]),
        ),
      ],
    );
  }
}
