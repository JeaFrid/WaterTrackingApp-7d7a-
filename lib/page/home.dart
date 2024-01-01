import 'package:cosmos/cosmos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterapp/theme/color.dart';
import 'package:waterapp/widget/alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool water1 = true;
  bool water2 = true;
  bool water3 = true;
  bool water4 = true;
  void deleteAll() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    db.clear();
  }

  void setOne() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    await db.setStringList(
      CosmosRandom.randomTag(),
      [
        CosmosTime.getNowTimeString(),
        "0",
        "0",
        "0",
        "0",
      ],
    );
  }

  void waterCalculater() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    Set<String> allData = db.getKeys();

    for (var element in allData) {
      List? getList = db.getStringList(element);
      String getTimeDate = getList?[0];
      if (getTimeDate.split(" ")[0] ==
          "${CosmosTime.day()}/${CosmosTime.month()}/${CosmosTime.year()}") {
        //BUGÜN
        String day1 = getList?[1];
        String day2 = getList?[2];
        String day3 = getList?[3];
        String day4 = getList?[4];
        if (day1 == "0") {
          water1 = true;
          setState(() {});
        } else {
          water1 = false;
          setState(() {});
        }
        if (day2 == "0") {
          water2 = true;
          setState(() {});
        } else {
          water2 = false;
          setState(() {});
        }
        if (day3 == "0") {
          water3 = true;
          setState(() {});
        } else {
          water3 = false;
          setState(() {});
        }
        if (day4 == "0") {
          water4 = true;
          setState(() {});
        } else {
          water4 = false;
          setState(() {});
        }
      }
    }
  }

  void getWater() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    Set<String> data = db.getKeys();

    if (data.toString() == "{}") {
      await db.setStringList(
        CosmosRandom.randomTag(),
        [
          CosmosTime.getNowTimeString(),
          "0",
          "0",
          "0",
          "0",
        ],
      );
    } else {
      
      waterCalculater();
    }
  }

  @override
  void initState() {
    super.initState();
    getWater();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CosmosBody(
        scrollable: true,
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "JeaWater",
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          // Su paneli
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: water1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CosmosImage(
                        "assets/water.gif",
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        "0.5L",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: water2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CosmosImage(
                        "assets/water.gif",
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        "0.5L",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: water3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CosmosImage(
                        "assets/water.gif",
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        "0.5L",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: water4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CosmosImage(
                        "assets/water.gif",
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        "0.5L",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () async {
              alert(
                context,
                "Su içtim",
                "Yarım litre su içtiğinizi onaylıyorsunuz.",
                "Tamam",
                () async {
                  SharedPreferences db = await SharedPreferences.getInstance();
                  Set<String> allData = db.getKeys();
                  int count = 0;
                  for (var element in allData) {
                    count++;
                    List? getList = db.getStringList(element);
                    String getTimeDate = getList?[0];
                    if (getTimeDate.split(" ")[0] ==
                        "${CosmosTime.day()}/${CosmosTime.month()}/${CosmosTime.year()}") {
                      //BUGÜN
                      String day1 = getList?[1];
                      String day2 = getList?[2];
                      String day3 = getList?[3];
                      String day4 = getList?[4];
                      if (day1 == "0") {
                        day1 = "1";
                        db.setStringList(
                          allData.toList()[count - 1],
                          [getTimeDate.split(" ")[0], day1, day2, day3, day4],
                        );
                      } else if (day2 == "0") {
                        day2 = "1";
                        db.setStringList(
                          allData.toList()[count - 1],
                          [getTimeDate.split(" ")[0], day1, day2, day3, day4],
                        );
                      } else if (day3 == "0") {
                        day3 = "1";
                        db.setStringList(
                          allData.toList()[count - 1],
                          [getTimeDate.split(" ")[0], day1, day2, day3, day4],
                        );
                      } else if (day4 == "0") {
                        day4 = "1";
                        db.setStringList(
                          allData.toList()[count - 1],
                          [getTimeDate.split(" ")[0], day1, day2, day3, day4],
                        );
                      } else {
                        print(getList);
                        Navigator.pop(context);
                        // ignore: use_build_context_synchronously
                        alert(
                          context,
                          "Harika!",
                          "Günlük minimum içilmesi gereken su miktarını aldınız.",
                          "Tamam",
                          () {},
                        );
                      }
                    }
                  }
                  waterCalculater();
                  Navigator.pop(context);
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              decoration: BoxDecoration(
                color: containerColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: textColor.withOpacity(0.2),
                ),
              ),
              child: Center(
                child: Text(
                  "Su içtim",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
