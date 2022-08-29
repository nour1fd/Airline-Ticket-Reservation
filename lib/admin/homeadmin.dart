
import 'package:flutter/material.dart';
import 'package:plane/admin/button/add_trips/addtrips.dart';
import 'package:plane/admin/button/delete/view_trips.dart';
import 'package:plane/admin/button/update/viewtrip_update.dart';
import 'package:plane/admin/button/view/viewtrips.dart';
import 'package:plane/admin/loginadmin.dart';
import 'package:plane/view/auth/login.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,

        actions: [
          TextButton(child: Text("Logout",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),),
            onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => LogIn()) );
            },),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white30,
        foregroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("wellcome our Admin ",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.black54),),
                SizedBox(height: 40.0,),
              MaterialButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=> ViewTrips()));
              },
                child: Text(
                  "View Trips",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent
                  ),
                ),
                color: Colors.white54,
                padding: EdgeInsets.symmetric(horizontal: 130.0),
              ),
              SizedBox(height: 40.0,),
              MaterialButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=> AddTrip()));
              },
                child: Text(
                  "Add Trip",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent
                  ),
                ),
                color: Colors.white54,
                padding: EdgeInsets.symmetric(horizontal: 130.0),
              ),
              SizedBox(height: 30.0,),
              MaterialButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=> ViewTripsDelet()));

              },
                child: Text(
                  "Delete Trip",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent
                  ),

                ),
                color: Colors.white54,
                padding: EdgeInsets.symmetric(horizontal: 90.0),

              ),
              SizedBox(height: 30.0,),
              MaterialButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute( builder: (BuildContext context)=> ViewTripsUpdate()));
              },
                child: Text(
                  "Modify Trip",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent
                  ),
                ),
                color: Colors.white54,
                padding: EdgeInsets.symmetric(horizontal: 40.0),

              ),
              // Expanded(
              //     child:
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Image.asset("assets/images/process.gif",width: 200,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
