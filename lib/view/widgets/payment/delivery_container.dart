import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/auth_controller.dart';
import 'package:sonatshi/logic/controller/payment_controller.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final phoneController = TextEditingController();
  int radioIndex = 1;
  bool changeColor = false;

  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          address: 'Gaza street, amman',
          name: 'Osama Ameerah',
          phone: '+962770706815',
          title: 'Sonatshi shop',
          value: 1,
          icon: Container(),
          color: changeColor ? Colors.white : Colors.grey.shade300,
          onChanged: (int? value) {
            setState(() {
              radioIndex = value!;
              changeColor = !changeColor;
            });
          },
        ),
        const Gap(10.0),
        Obx(()=> buildRadioContainer(
            address: controller.address.value,
            name: authController.displayUserName,
            phone: controller.phoneNumber.value ,
            title: 'Delivery',
            value: 2,
            color: changeColor ? Colors.grey.shade300 : Colors.white,
            onChanged: (int? value) {
              setState(() {
                radioIndex = value!;
                changeColor = !changeColor;
              });
              controller.updatePosition();
            },
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: 'Enter your phone number',
                  titleStyle: TextStyle(
                    fontSize: 16.0,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  radius: 10.0,
                  textConfirm: 'Save ',
                  textCancel: 'Cancel',
                  onConfirm: () {
                    Get.back();
                    controller.phoneNumber.value = phoneController.text;
                  },
                  content: Padding(
                    padding: const EdgeInsets.all(
                      15.0,
                    ),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      onSubmitted: (value) {
                        phoneController.text = value;
                      },
                      cursorColor:
                          Get.isDarkMode ? Colors.grey : mainBackDarkColor,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.phone_outlined,
                          color: Colors.grey,
                        ),
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            phoneController.clear();
                          },
                          icon: const Icon(Icons.close),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Get.isDarkMode
                                ? primaryDarkColor
                                : mainLightColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? primaryDarkColor
                                  : mainLightColor,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? primaryDarkColor
                                  : mainLightColor,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? primaryDarkColor
                                  : mainLightColor,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        hintStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your phone number',
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.contact_phone_outlined,
                color: Get.isDarkMode ? primaryDarkColor : mainLightColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) =>
      Container(
        height: 120.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(
                .2,
              ),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: value,
              groupValue: radioIndex,
              onChanged: (int? value) {
                onChanged(value);
              },
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            ),
            const Gap(10.0),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: title,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  const Gap(5.0),
                  TextUtils(
                    text: name,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  const Gap(5.0),
                  Row(
                    children: [
                      const Text('🇯🇴 '),
                      TextUtils(
                        text: phone,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      const Gap(100.0),
                      SizedBox(
                        child: icon,
                      ),
                    ],
                  ),
                  const Gap(5.0),
                  TextUtils(
                    text: address,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
