import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text("ADLER",
                style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 50.0,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 20.0,),
              Text("Who am i ??",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                ),
              ),
              SizedBox(height: 10.0,),
              Text("FreeFlight Systems designs, manufactures, sells, and supports avionics systems that improve the safety,"
                  " efficiency and affordability of flying. We specialize in technologies and solutions that bring the benefits of the NextGen airspace transformation to all segments of aerospace. "
                  "We are known for the quality and reliability of our products, the flexibility and compatibility of our solutions, and our commitment to long-term client satisfaction."
                  ,style: TextStyle(
                  color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20.0
              ),
              ),
              SizedBox(height: 30.0,),
              Text("Who we serve ??",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize:25.0
                ),
              ),
              SizedBox(height: 10.0,),
              Text("Our modular and scalable products can be used as stand-alone devices or as fully integrated avionics systems. "
                  "Markets served include General Aviation, Business Aviation, Special Missions, Government / Military, Airline (regional / commercial), Helicopter and OEM. "
                  "We offer solutions for fixed-wing aircraft, rotor-wing, unmanned aerial vehicles,"
                  " and airport infrastructure.",style: TextStyle(
              color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20.0
              ),)

            ],
          ),
        ),
      ),
    );
  }
}
