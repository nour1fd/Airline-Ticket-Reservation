import 'package:flutter/material.dart';
import 'package:plane/admin/button/update/details_one_flight_update.dart';
import 'package:plane/admin/model/adminmodel.dart';

class DetailsUpdate extends StatefulWidget {
  const DetailsUpdate( this.flightModel) ;
  final FlightModeladmin flightModel;

  @override
  State<DetailsUpdate> createState() => _DetailsUpdateState();
}

class _DetailsUpdateState extends State<DetailsUpdate> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder:(context,StateSetter setState){
      return Padding(
        padding: const EdgeInsets.all(13.0),
        child: Card(shadowColor: Colors.deepOrangeAccent,
          elevation: 5.0,
          color: Colors.white70,
          child: ListTile(
            onTap: () {
              Navigator.push
                (context, MaterialPageRoute(
                  builder: (BuildContext context)=>DetailsForFlightUpdate(flightModel: widget.flightModel,)));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(widget.flightModel.id.toString(),
                style: TextStyle(
                    color: Colors.deepOrangeAccent
                ),),
            ),
            title: Row(
              children: [
                Text(widget.flightModel.departuresFrom+"    --->    "+ widget.flightModel.arrivalsTo,
                  style: (
                      TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      )
                  ),
                )
              ],
            ),
            subtitle: Text(widget.flightModel.dateTime.toString()),
          ),
        ),
      );
    } );

  }
}

