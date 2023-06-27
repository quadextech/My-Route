import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/constants/constant.dart';

class Swicher extends StatefulWidget {
  const Swicher({
    Key? key,
  }) : super(key: key);

  @override
  State<Swicher> createState() => _SwicherState();
}

class _SwicherState extends State<Swicher> {
  bool isCostomer = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 140,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          svgtitlePeople,
          color: isCostomer ? primaryColor : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: 50,
            height: 20,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCostomer = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCostomer
                            ? primaryColor
                            : black,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCostomer = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCostomer
                            ? black
                            : primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SvgPicture.asset(
          svgmytitleCar,
          color: isCostomer ? grey : primaryColor,
        ),
      ]),
    );
  }
}
