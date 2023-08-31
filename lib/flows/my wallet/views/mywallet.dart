import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/app_image.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import 'package:myroute/flows/my%20wallet/widgets/wallet_container.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  bool isBalance = false;
  bool isMasterCard = false;
  bool isDebitCard = false;
  bool isTopUp = false;
  bool isTransfer = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppBackButton(),
        title: Text('My Wallet', style: body3(black, TextDecoration.none)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          WalletContainer(
            balance: 5000,
          ),
          const SizedBox(
            height: 30,
          ),
          Text('My Payment Methods', style: headline4(black)),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                isBalance = true;
                isDebitCard = false;
                isMasterCard = false;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(svgwallet, color: greenColor),
                    Text('   MyRoute balance',
                        style: body4(Colors.grey[600], TextDecoration.none))
                  ],
                ),
                if (isBalance == true)
                  Icon(Icons.check_box_outlined, color: greenColor),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 0.0,
            color: grey5,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              setState(() {
                isBalance = false;
                isDebitCard = false;
                isMasterCard = true;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      svgcard,
                      color: greenColor,
                    ),
                    Text('   Mastercard 19**********098',
                        style: body4(Colors.grey[600], TextDecoration.none))
                  ],
                ),
                if (isMasterCard == true)
                  Icon(Icons.check_box_outlined, color: greenColor),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 0.0,
            color: grey5,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              setState(() {
                isBalance = false;
                isDebitCard = true;
                isMasterCard = false;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(svgcard, color: greenColor),
                    Text('   Add debit card',
                        style: body4(Colors.grey[600], TextDecoration.none))
                  ],
                ),
                if (isDebitCard == true)
                  Icon(Icons.check_box_outlined, color: greenColor),
              ],
            ),
          ),
          // if (isTopUp)
          // showTopUp(context)
        ]),
      ),
    );
  }
}
