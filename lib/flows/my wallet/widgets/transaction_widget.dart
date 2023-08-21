import 'package:flutter/material.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/textstyle.dart';

class TransactionWidget extends StatefulWidget {
  final String status;
  final String type;
  const TransactionWidget({super.key, required this.status, required this.type});

  @override
  State<TransactionWidget> createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: grey5,
          child: Icon(
             widget.type =='withdrawal'? Icons.arrow_forward_ios_outlined: Icons.arrow_downward_outlined,
            color: widget.type =='withdrawal'? successColor:warningColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: Text(
                    'Transfer to Boluwatife Jennifer',
                    overflow: TextOverflow.ellipsis,
                    style: body3(black, TextDecoration.none),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                 widget. status,
                  style: body4(widget.status == 'Processed'?successColor: widget.status == 'Pending'? warningColor :errorColor, TextDecoration.none ),
                ),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '- N 1,000.00',
                  style: headline4(black),
                ),
                const SizedBox(height: 10),
                Text(
                  '12:00PM',
                  style: body4(const Color.fromARGB(255, 218, 210, 210), TextDecoration.none),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}