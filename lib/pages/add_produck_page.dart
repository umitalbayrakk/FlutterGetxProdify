import 'package:flutter/material.dart';
import 'package:flutter_getx_state_managment/controllers/shopping_controller.dart';
import 'package:flutter_getx_state_managment/utils/color.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final ShoppingController controller = Get.find(); 
  AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: AppColors.scaffoldBackgroundColor, title: Text("Ürün Ekle")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Ürün Adı")),
            ),
            SizedBox(height: 20),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: "Fiyat Giriniz", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),

            Container(
              width: 300,
              decoration: BoxDecoration(color: AppColors.buttonColor, borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () {
                  final name = nameController.text;
                  final price = double.tryParse(priceController.text) ?? 0;
                  controller.addProduct(name, price);
                  if (name.isNotEmpty && price > 0) {
                    Get.back();
                  }
                },
                child: Text("Ekle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
