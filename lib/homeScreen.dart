import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_v2/services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = 'PATHANAMTHITTA';
  final WeatherService weatherService = WeatherService();
  Map<String, dynamic>? weatherData;
  Map<String, dynamic>? airQualityData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    setState(() {
      isLoading = true;
    });
    try {
      String locationKey = await weatherService.getLocationKey(cityName);
      Map<String, dynamic> weather =
          await weatherService.getWeatherData(locationKey);
      Map<String, dynamic>? airQuality =
          await weatherService.getAirQuality(locationKey);
      setState(() {
        weatherData = weather;
        airQualityData = airQuality;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          cityName,
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      drawer: const Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text('${TimeOfDay.now().format(context)}',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w200)),
                Text('${DateTime.now().toString().split(' ')[0]}',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(100, 50, 100, 30),
                  child: Image(image: AssetImage('assets/sunny.png')),
                ),
                Text(
                  'SUNNY',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          // Pinned header for the 25° part
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 196.0, // Min height when pinned
              maxHeight: 200.0, // Max height when not pinned
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: 140,
                            height: 140,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      //Text(today),
                                      Text(
                                        "${weatherData!['Temperature']['Metric']['Value']}°",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 55,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 39),
                                      Text(
                                        "H : 28",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "L : 24",
                                        style: GoogleFonts.raleway(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 140,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "AIR QUALITY 22",
                                      style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Fair",
                                      style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 140,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "UV INDEX 00",
                                      style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Low",
                                      style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .85,
                      child: const Divider(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // The rest of the scrollable content
          SliverToBoxAdapter(
            child: Column(
              children: [
                /*SizedBox(
                  width: MediaQuery.of(context).size.width * .85,
                  child: const Divider(),
                ),*/
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * .85,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'HOURLY TEMPERATURE',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * .85,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'WEEKLY TEMPERATURE',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .04,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'HUMIDITY : ${weatherData!['RelativeHumidity']}%',
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .04,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'WIND : ${weatherData!['Wind']['Speed']['Metric']['Value']} km/h',
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .04,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                            'AIR QUALITY INDEX : ${airQualityData != null ? airQualityData!['AQI'] : 'N/A'}',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .04,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text('UV INDEX WITH IMAGE',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .04,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text('SUNSET / RISE TIME WITH IMAGE',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .04,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'FEELS LIKE',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "25°",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom delegate for SliverPersistentHeader
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
