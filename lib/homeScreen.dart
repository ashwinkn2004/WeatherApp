//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = 'ERNAKULAM';
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
            //Icons.more_vert_outlined,
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
      body: Column(
        children: [
          Container(
            height: 400,
            width: 500,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text('10:30 AM',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w200
                    )),
                Text('Wednesday 11.09.24',
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
                )
              ],
            ),
          ),
          // Container for displaying the temperature of the current city with high and low temp
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
                        const SizedBox(height: 35),
                        Text(
                          "25°",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        //const SizedBox(height: 10),
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

              // Next container with air quality
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
            child: Divider(),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),

          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .08,
              ),
              Container(
                height: 70,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WIND",
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "5 km/h",
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
              SizedBox(
                width: MediaQuery.of(context).size.height * .1,
              ),
              Container(
                height: 70,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HUMIDITY",
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "98%",
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
          )
        ],
      ),
    );
  }
}
