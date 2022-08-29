import 'package:get/get.dart';
import 'package:plane/business/acount_ddeatails/repo_info.dart';
import 'package:plane/model/account_model.dart';

class ViewAccount extends GetxController{
  var isloding= true.obs;
  RxList account = <Accounts>[].obs;

  @override
  void onInit() {
  super.onInit();
    showaccountinfo();
  }
  void showaccountinfo()async{
    try {
      isloding(true);
      var flight = await Get_Account.fetchaccount();
      if (flight != null) {
        account.value = flight;
      }
    } finally {isloding(false);}
  }
}
