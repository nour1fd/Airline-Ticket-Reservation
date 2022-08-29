import 'package:get/get.dart';
import 'package:plane/business/flights_gtx/repository.dart';
import 'package:plane/model/flight_info/flightmodel.dart';

class ViewFlightgetx extends GetxController{
  var isloding= true.obs;
 List<FlightModel> flightmodel = <FlightModel>[];
  RxList<FlightModel> flightmodelsearch = RxList<FlightModel>([]);


  @override
  void onInit() {
    flightmodelsearch.value=flightmodel;
    super.onInit();

  }
  void showflight()async{
    try {
      isloding(true);
      var flight = await Get_Flights.fetchproduct();
      if (flight != null) {
        flightmodel= flight.cast<FlightModel>();
      }
    } finally {isloding(false);}
  }

}
