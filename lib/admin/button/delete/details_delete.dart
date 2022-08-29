import 'package:flutter/material.dart';
import 'package:plane/admin/button/delete/details_one_trip.dart';
import 'package:plane/admin/model/adminmodel.dart';

class DetailsDelet extends StatefulWidget {
  const DetailsDelet( this.flightModel) ;
  final FlightModeladmin flightModel;

  @override
  State<DetailsDelet> createState() => _DetailsDeletState();
}

class _DetailsDeletState extends State<DetailsDelet> {
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
                builder: (BuildContext context)=>DetailsForFlightDelet(flightModel: widget.flightModel,)));
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
  }
}
