import 'package:get/get.dart';
import 'package:plane/admin/bussiness/view/repo.dart';
import 'package:plane/admin/model/adminmodel.dart';

class ViewFlightgetxadmin extends GetxController{
  var isloding= true.obs;
  RxList<FlightModeladmin> flightmodel = <FlightModeladmin>[].obs;
  @override
  void onInit() {
    showflight();
    super.onInit();
  }
  void showflight()async{    update();

  try {
      isloding(true);
      var flight = await Get_Flight.fetchproduct();
      if (flight != null) {
        flightmodel.value = flight.cast<FlightModeladmin>();
      }
    } finally {isloding(false);}
  }
}
