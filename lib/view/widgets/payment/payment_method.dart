import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: Column(
        children: [
          buildRadioPayment(
            onChanged: (int? value){
              setState(() {
                radioPaymentIndex = value!;
              });
            },
            value: 1,
            name: 'PayPal',
            image: 'assets/images/paypal.png',
            scale: 0.7,

          ),
          const Gap(15.0,),
          buildRadioPayment(
            onChanged: (int? value){
              setState(() {
                radioPaymentIndex = value!;
              });
            },
            value: 2,
            name: 'Google pay',
            image: 'assets/images/google.png',
            scale: 0.8,

          ),
          const Gap(15.0,),
          buildRadioPayment(
            onChanged: (int? value){
              setState(() {
                radioPaymentIndex = value!;
              });
            },
            value: 3,
            name: 'Credit Card',
            image: 'assets/images/credit.png',
            scale: 0.7,

          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required String name,
    required double scale,
    required Function onChanged,
    required int value,
  }) =>
      Container(
        height: 50.0,
        width: double.infinity,
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  scale: scale,
                ),
                const Gap(
                  10.0,
                ),
                TextUtils(
                  text: name,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
            Radio(
                value: value,
                fillColor: MaterialStateColor.resolveWith((states) => mainLightColor),
                groupValue: radioPaymentIndex,
                onChanged: (int? value){
                  onChanged(value);
                },
            ),
          ],
        ),
      );
}
