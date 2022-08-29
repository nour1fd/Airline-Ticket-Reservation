import 'package:plane/model/flight_info/flightmodel.dart';
import 'package:plane/model/view/flight_web.dart';

class characterrepost {
  final characterweb  characterwweb ;

  characterrepost(this.characterwweb);
  Future <List<FlightModel>?> gettall ()async{
    final characters =await characterwweb.gettall();
    return characters!.map((character) => FlightModel.fromJson(character)).toList();

  }
}