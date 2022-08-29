import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane/admin/bussiness/view/viewflight.dart';
import 'package:plane/admin/button/update/detaila_update.dart';

class ViewTripsUpdate extends StatelessWidget {
  final ViewFlightgetxadmin viewController = Get.put(ViewFlightgetxadmin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title:  Text("All flights available",style:
        Theme.of(context).textTheme.headline5!.copyWith(color:
        Colors.black,
          fontWeight: FontWeight.bold,
        )
        ),
      ),
      body:Obx(
              (){
            if(viewController.isloding.value)
              return Center(child: CircularProgressIndicator(),);
            else
              return ListView.builder(
                itemCount: viewController.flightmodel.length,
                itemBuilder: (context, index) {
                  return StatefulBuilder(builder:(context,StateSetter setState){
                    return DetailsUpdate(viewController.flightmodel[index]);
                  }
                      );
                },
              )   ;
          }
      )
      ,
    );
  }
}
