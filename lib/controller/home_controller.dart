import 'package:get/get.dart';

import '../model/info_model.dart';
import '../model/products_data_model.dart';
import '../services/api/api_client.dart';

class HomeController extends GetxController{
  Rx<ProductsDataModel> productsDataModel= ProductsDataModel().obs;
  Rx<InfoModel> infoModel= InfoModel().obs;

  RxBool isLoading = false.obs;

  Future<bool> getProducts() async {
    var response = await ApiClient().get('/get-product').catchError((e) {
      // Utils.showSnackBar(e.message);
      print(e.message);
    });
    if(response==null)return false;
    productsDataModel.value = productsDataModelFromJson(response);
    print("loaded");
    return true;
  }

  Future<void> getInfoData() async {
    var response = await ApiClient().get('/info').catchError((e) {
      // Utils.showSnackBar(e.message);
      print(e.message);
    });
    if(response==null)return;
    print(response);
    infoModel.value = infoModelFromJson(response);
    update();
  }
  @override
  void onInit() {
    getInfoData();
    super.onInit();
  }

}