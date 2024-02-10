import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioIndex = 1;
  bool changeColor = false;
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
          color: changeColor ? Colors.white : Colors.grey.shade300,
          onChanged: (int? value) {
            setState(() {
              radioIndex = value!;
              changeColor = !changeColor;
            });
          },
        ),
        const Gap(10.0),
        buildRadioContainer(
          address: 'Gaza street, amman',
          name: 'Shadi Ameerah',
          phone: '+962780706815',
          title: 'Delivery',
          value: 2,
          color: changeColor ? Colors.grey.shade300 : Colors.white,
          onChanged: (int? value) {
            setState(() {
              radioIndex = value!;
              changeColor = !changeColor;
            });
          },
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
                  TextUtils(
                    text: phone,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
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
