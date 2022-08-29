import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane/business/flights_gtx/viewflight_gtx.dart';
import 'package:plane/view/auth/login.dart';

import '../flightsearch.dart';
class BookingFlight extends StatefulWidget {
  @override
  State<BookingFlight> createState() => _BookingFlightState();
}

class _BookingFlightState extends State<BookingFlight> {
  final ViewFlightgetx viewControllersearching = Get.put(ViewFlightgetx());

  var fromplace = TextEditingController();

  var toplace = TextEditingController();

  var departure = TextEditingController();

  var passenger = TextEditingController();

  var typeofticket = "Vip";
  var dropi = "Home";
  var dr = "2";
  var menu = ["noni", "fd", "ror", "Home", "22/3/2023", "lolo,"];
  var passengger = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.deepOrangeAccent,
        title: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            children: [
              Text(
                "AdER",
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
              Icon(
                Icons.airplanemode_active_outlined,
                color: Colors.deepOrangeAccent,
              )
            ],
          ),
        ),
        titleSpacing: 60,
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Book Flight",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                children: [
                  Text(
                    "Country :  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400),
                  ),

                ],
              ),

              SizedBox(
                height: 20.0,
              ),

              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogIn()));
                },
                child: Text(
                  "Search Flight",
                  style: TextStyle(fontSize: 30.0),
                ),
                color: Colors.deepOrangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//         SizedBox(height: 40.0,),
//           Text(" All flight in our system ",style: TextStyle(
//             color: Colors.grey,
//             fontSize: 20.0,
//           )),
//           SizedBox(height: 4.0,),
//           //List
//           Expanded(
//             child: Obx(
//                     (){
//
//                   if(viewController.isloding.value)
//                     return Center(child: CircularProgressIndicator(),);
//                   else
//                     return ListView.builder(
//                       itemCount: viewController.flightmodel.length,
//                       itemBuilder: (context, index) {
//                         return FlightTile(viewController.flightmodel[index]);
//                       },
//                     )   ;
//                 }
//             ),
//           )