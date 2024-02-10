import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/product_controller.dart';

class FavoriteScreen extends StatelessWidget {
    FavoriteScreen({super.key});
 final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: const Text('Favorites'),
      ),
      body: Obx(()=>ConditionalBuilder(
        condition: controller.favoriteList.isNotEmpty,
        builder:(context)=> ListView.separated(
          itemCount: controller.favoriteList.length,
          itemBuilder:(context,index)=> buildFavItem(
            image:controller.favoriteList[index].image,
            price:controller.favoriteList[index].price,
            title:controller.favoriteList[index].title,
            productId:controller.favoriteList[index].id,
          ),
          separatorBuilder: (context,index) =>  Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ),
        fallback:(context)=>  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Image.asset('assets/images/heart.png',),
              ),
              const Gap(20.0),
              const Text(
                'Add your favorite products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),),


    );
  }

  Widget buildFavItem({
      required String image,
      required String title,
      required double price,
      required int productId,

})=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Image.network(image,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(10.0),
         Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
                maxLines: 1,
              ),
              const Gap(2.0),
              Text('\$ $price'),
            ],
          ),
        ),
        const Spacer(),
        IconButton(onPressed: (){
          controller.manageFavorites(productId);
        },
          icon: const Icon(Icons.favorite,color: Colors.red,),)
      ],
    ),
  );
}
