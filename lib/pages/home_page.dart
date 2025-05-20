import 'package:flutter/material.dart';
import 'package:flutter_getx_state_managment/controllers/shopping_controller.dart';
import 'package:flutter_getx_state_managment/pages/add_produck_page.dart';
import 'package:flutter_getx_state_managment/utils/color.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // Controller Bağlama
  final ShoppingController controller = Get.put(ShoppingController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Prodify",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () => Get.to(() => AddProductPage()))],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.produckts.length,
          itemBuilder: (context, index) {
            final produckt = controller.produckts[index];
            return ListTile(
              title: Text(produckt.name),
              subtitle: Text(produckt.price.toString()),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: AppColors.buttonColor),
                onPressed: () => controller.deleteProduct(produckt.id),
              ),
            );
          },
        ),
      ),
    );
  }
}
