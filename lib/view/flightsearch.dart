import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plane/model/flight_info/flightmodel.dart';

class FlightTilesearch extends StatelessWidget{
  final FlightModel searchingflight;
  const  FlightTilesearch(this.searchingflight);

  @override
  Widget build(BuildContext context) {
return    Padding(
      padding: const EdgeInsets.all(13.0),
      child: Card(shadowColor: Colors.deepOrangeAccent,
        elevation: 5.0,
        color: Colors.white70,
        child: ListTile(

          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(searchingflight.id.toString(),
              style: TextStyle(
                  color: Colors.deepOrangeAccent
              ),),
          ),

        ),
      ),
    );
  }

}