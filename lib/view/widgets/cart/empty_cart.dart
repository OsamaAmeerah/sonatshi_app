import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/utils/theme.dart';

import '../../../routes/routes.dart';
class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150.0,
            color: Get.isDarkMode ? Colors.grey : Colors.black,
          ),
          const Gap(40.0),
          RichText(
            text: TextSpan(
            children: [
              TextSpan(
                text: 'Your Cart is ',style: TextStyle(
                color: Get.isDarkMode ? Colors.grey[400] : Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              TextSpan(
                text: 'Empty',style: TextStyle(
                color: Get.isDarkMode ? primaryDarkColor : Colors.grey,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ),),
          const Gap(10.0),
          const Text(
            'Add items to get start' ,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const Gap(15.0),
          ElevatedButton(
            style:  ButtonStyle(
              backgroundColor: MaterialStatePropertyAll( Get.isDarkMode ?  Colors.grey : Colors.black),
            ),
            onPressed: (){
            Get.back();
          }, child:Text('Go to home',style: TextStyle(
            color: Get.isDarkMode ?  mainBackDarkColor: Colors.white,
          ),),
          ),

        ],
      ),
    );
  }
}
