import 'package:flutter_getx_state_managment/models/shopping_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart' show Uuid;

class ShoppingController extends GetxController {
  // Ürün Listesi
  var produckts = <Produckt>[].obs;
  // Ürün Ekleme
  void addProduct(String name, double price) {
    if (name.isEmpty || price <= 0) {
      Get.snackbar('Hata', 'Ürün adı veya fiyatı boş veya sıfır olamaz', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    final produckt = Produckt(id: Uuid().v4(), name: name, price: price);
    produckts.add(produckt);
    Get.snackbar('Başarılı', 'Ürün eklendi: $name', snackPosition: SnackPosition.BOTTOM);
  }
// Ürün Silme
  void deleteProduct(String id) {
    produckts.removeWhere((produckt) => produckt.id == id);
    Get.snackbar('Başarılı', 'Ürün silindi', snackPosition: SnackPosition.BOTTOM);
  }
}
