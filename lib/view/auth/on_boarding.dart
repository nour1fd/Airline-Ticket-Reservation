import 'package:flutter/material.dart';
import 'package:plane/model/shared/cachhelper.dart';
import 'package:plane/view/auth/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardcontroller = PageController();
  bool isLast = false;

  List<Boardingmodel> boarding = [
    Boardingmodel(image: "assets/images/alder.png",
        title: "",
        body: ""),
    Boardingmodel(
        image: "assets/images/one.png",
        title: "Choose Your Destination ",
        body: "Surely you will find a flight to the city you want to go to, 'we try to cover all countries'"),
    Boardingmodel(
        image: "assets/images/second.png",
        title: "Quick Boarding",
        body: "You only need 5 minutes to book your ticket"),
    Boardingmodel(
        image: "assets/images/team.jpg",
        title: "With best planes you will have the BEST travelling",
        body: "We guarantee you a journey full of fun and comfort on our plane"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                cachHelper.Savedataa(key: "boarding", value: true)
                    .then((value) {
                  print(value);
                  if (value) {
                    print("ia am on bording skip");
                    print(value);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LogIn()));
                  }
                });
              },
              child: Text(
                "SKIP",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    itemBuilder: (context, index) =>
                        buildBording(boarding[index]),
                    itemCount: boarding.length,
                    controller: boardcontroller,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        {
                          setState(() {
                            isLast = true;
                          });
                        }
                        print("last of pages");
                      }
                    }),
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardcontroller,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.indigo,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 4,
                      activeDotColor: Colors.deepOrangeAccent,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                    backgroundColor: Colors.deepOrangeAccent,
                    onPressed: () => {
                      boardcontroller.nextPage(
                          duration: Duration(
                            microseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn),
                      if (isLast)
                        {
                          print("$isLast" + "lasting"),
                          cachHelper.Savedataa(key: "boarding", value: true)
                              .then((value) {
                            if (value) {
                              print("ia am on bording floating");
                              print(value);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LogIn()));
                            }
                          })
                        },

                    },
                  ),
                ],
              )
            ],
          ),
        )
    );
  }

  Widget buildBording(Boardingmodel boardingmodelsss) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset("${boardingmodelsss.image}"),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("${boardingmodelsss.title}",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 15.0,
          ),
          Text("${boardingmodelsss.body}",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              )),
        ],
      );
}

class Boardingmodel {
  final String image;
  final String title;
  final String body;

  Boardingmodel({
    required this.image,
    required this.title,
    required this.body,
  });
}
