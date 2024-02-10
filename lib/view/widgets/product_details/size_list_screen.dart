import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/utils/theme.dart';

class SizeList extends StatefulWidget {
  const SizeList({super.key});

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10.0,
      ),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  currentSelected = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: currentSelected == index
                      ? Get.isDarkMode
                          ? Colors.grey.withOpacity(.4)
                          : mainLightColor.withOpacity(.4)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey.withOpacity(.4),
                    width: 2.0,
                  ),
                ),
                child: Text(
                  sizeList[index],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10.0,
              ),
          itemCount: sizeList.length),
    );
  }
}
