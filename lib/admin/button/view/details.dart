import 'package:flutter/material.dart';
import 'package:plane/admin/button/view/details_one_flight.dart';
import 'package:plane/admin/model/adminmodel.dart';

class Details extends StatelessWidget {
  const Details( this.flightModel) ;
  final FlightModeladmin flightModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Card(shadowColor: Colors.deepOrangeAccent,
        elevation: 5.0,
        color: Colors.white70,
        child: ListTile(
          onTap: () {
            Navigator.push
              (context, MaterialPageRoute(
                builder: (BuildContext context)=>DetailsForFlight(flightModel: flightModel,)));
          },
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(flightModel.id.toString(),
              style: TextStyle(
                  color: Colors.deepOrangeAccent
              ),),
          ),
          title: Row(
            children: [
              Text(flightModel.departuresFrom+"    --->    "+ flightModel.arrivalsTo,
                style: (
                    TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    )
                ),
              )
            ],
          ),
          subtitle: Text(flightModel.dateTime.toString()),
        ),
      ),
    );
  }
}
