import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/app_image.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/flows/my%20wallet/widgets/mywallet_button.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

import '../../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../../onboarding/onboarding.dart';
import '../views/add_bank_account.dart';
import '../views/mytransactions.dart';
import '../views/mywallet.dart';

class WalletContainer extends StatefulWidget {
  final int balance;

  WalletContainer({
    super.key,
    required this.balance,
  });

  @override
  State<WalletContainer> createState() => _WalletContainerState();
}

class _WalletContainerState extends State<WalletContainer> {
  final int _currentIndex = 0;
  bool isTopUp = false;
  bool isTransfer = false;
  TextEditingController passwordController = TextEditingController();
  bool passwordError = false;
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 230,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: black),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MyRoute balance',
            style: body4(grey5, TextDecoration.none),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(svgnaira, color: white, height: 15),
              Text(
                '5,000',
                style: headline1(white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: SliderContainer(
                      color: _currentIndex == index ? primaryColor : grey5),
                );
              })),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyWalletButton(
                  action: isTopUp,
                  color: Colors.grey[800],
                  onPressed: () {
                    setState(() {
                      isTopUp = !isTopUp;
                    });
                    if (isTopUp) {
                      
                      showTopUp(context);
                    }
                  },
                  width: 140,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Top Up  ',
                            style: body4(white, TextDecoration.none)),
                        Icon(Icons.add, size: 15, color: white)
                      ])),
              MyWalletButton(
                  action: isTransfer,
                  color: Colors.grey[800],
                  onPressed: () {
                    setState(() {
                      isTransfer = !isTransfer;
                    });
                  
                    showTransfer();
                  },
                  width: 140,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Transfer funds  ',
                            style: body4(white, TextDecoration.none)),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: white,
                        )
                      ])),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyTransactionsScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'See all Transactions  ',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                        decoration: TextDecoration.underline),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.grey[500], size: 20)
                ],
              ))
        ],
      ),
    );
  }

  showTopUp(BuildContext context) {
    final size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return CustomPopUpContainer(
            height: size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Where do you want to Top Up?', style: headline4(black)),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      myRouteBalance();
                    },
                    child: Container(
                      height: 65,
                      color: grey5,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                svgwallet,
                                color: greenColor,
                              ),
                              Text('  MyRoute balance',
                                  style: headline4(greenColor)),
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right, color: greenColor)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 65,
                      color: grey5,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                svgAutosave,
                                color: greenColor,
                              ),
                              Text('  My AutoSave balance',
                                  style: headline4(greenColor)),
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right, color: greenColor)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  showTransfer() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: CustomPopUpContainer(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose transfer destination',
                        style: headline4(black)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 65,
                        color: grey5,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            chooseBankAccount(context);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(bank, color: greenColor),
                                  Text('  My Bank Account',
                                      style: headline4(greenColor)),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_right,
                                  color: greenColor)
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 65,
                      color: grey5,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  svgAutosave,
                                  color: greenColor,
                                ),
                                Text('  My AutoSave balance',
                                    style: headline4(greenColor)),
                              ],
                            ),
                            Icon(Icons.keyboard_arrow_right, color: greenColor)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void myRouteBalance() {
    final TextEditingController controller = TextEditingController();
    bool masterCard = false;
    bool debitCard = false;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: CustomPopUpContainer(
                //height: size.height * 0.5,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Top Up MyRoute balance', style: headline4(black)),
                const SizedBox(
                  height: 20,
                ),
                const Text('Enter amount'),
                const SizedBox(
                  height: 10,
                ),
                mytextField(
                    controller: controller,
                    label: '5,000',
                    error: '',
                    errorCondition: false),
                const SizedBox(
                  height: 20,
                ),
                const Text('My payment methods'),
                const SizedBox(
                  height: 20,
                ),
                Row(
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
                    Checkbox(
                        activeColor: greenColor,
                        value: masterCard,
                        onChanged: (checkboxValue) {
                          setState(() {
                            checkboxValue = true;
                          });
                        })
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          svgcard,
                          color: greenColor,
                        ),
                        Text('   Add debit card',
                            style: body4(Colors.grey[600], TextDecoration.none))
                      ],
                    ),
                    Checkbox(
                        activeColor: greenColor,
                        value: debitCard,
                        onChanged: (checkboxValue) {
                          setState(() {
                            checkboxValue = true;
                          });
                        })
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                    textColor: white,
                    onPressed: () {
                      Navigator.pop(context);
                      message( false);
                    },
                    label: 'Confirm'),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
          );
        });
  }

  void message(isSuccess) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: CustomPopUpContainer(
                child: isSuccess
                    ? Column(
                        children: [
                          const SizedBox(height: 20),
                          SvgPicture.asset(success),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Success!', style: headline2(successColor)),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              'Your MyRoute balance has been successfully topped up with N 5,000'),
                          const SizedBox(
                            height: 30,
                          ),
                          AppButton(
                              textColor: white,
                              onPressed: () {},
                              label: 'Check Balance')
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 20),
                          SvgPicture.asset(svgerror),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Error!', style: headline2(errorColor)),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              'The balance is too low on your Mastercard 986******, Please use another payment method to continue'),
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(
                              textColor: white,
                              onPressed: () {},
                              label: 'Change payment method'),
                          const SizedBox(
                            height: 10,
                          ),
                          AppButton(
                              textColor: white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              label: 'Exit')
                        ],
                      )),
          );
        });
  }

  void chooseBankAccount(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: CustomPopUpContainer(
                //height: size.height * 0.5,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Choose Bank Account', style: headline4(black)),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    pay();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('First Bank',
                              style: body4(grey3, TextDecoration.none)),
                          Text('Boluwatife Jennifer',
                              style: body4(grey3, TextDecoration.none)),
                        ],
                      ),
                      Row(children: [
                        Text('1234567899',
                            style: body3(black, TextDecoration.none)),
                        Icon(Icons.keyboard_arrow_right,
                            color: greenColor, size: 20)
                      ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 3,
                  color: grey5,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddBankAccount()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, color: greenColor, size: 18),
                      Text('Add Bank',
                          style: body4(greenColor, TextDecoration.underline))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
          );
        });
  }

  void pay() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: CustomPopUpContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: '0',
                          hintStyle: body2(black, TextDecoration.none),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          prefix: SvgPicture.asset(svgnaira))),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Boluwatife Jennifer',
                              style: body4(grey3, TextDecoration.none)),
                        ],
                      ),
                      Row(children: [
                        Text('First Bank',
                            style: body4(grey3, TextDecoration.none)),
                        Text('1234567899',
                            style: body3(black, TextDecoration.none)),
                        Icon(Icons.keyboard_arrow_right,
                            color: greenColor, size: 20)
                      ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 3,
                  color: grey3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                  SvgPicture.asset(svgwallet, color: greenColor),
                  Text('MyRoute balance'),
                  Text('.', style: headline2(black)),
                  Text('N5,000'),
                ]),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                    onPressed: () {
                      Navigator.pop(context);
                      enterPassword(context);
                    },
                    label: 'Pay',
                    textColor: white),
                     const SizedBox(
                  height: 10,
                ),
              ],
            )),
          );
        });
  }

  void enterPassword(context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: CustomPopUpContainer(
                height: size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Pleaase enter your MyRoute Password',
                        style: headline4(black)),
                    const SizedBox(
                      height: 20,
                    ),
                    mytextField(
                      controller: passwordController,
                      label: 'Password*',
                      error: 'Enter a valid password',
                      errorCondition: passwordError,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Having some trouble?',
                          style: body4(black, TextDecoration.none),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Reset your password',
                            style: body4(greenColor, TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButton(
                        onPressed: () {
                          if (passwordController.text.isEmpty) {
                            setState() {
                              passwordError = true;
                            }
                          } else {
                            Navigator.pop(context);
                            transferMessage(true);
                          }
                        },
                        label: 'Confirm password',
                        textColor: white)
                  ],
                )),
          );
        });
  }

  void transferMessage( isSuccess) {

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: CustomPopUpContainer(
                child: isSuccess
                    ? Column(
                        children: [
                          const SizedBox(height: 20),
                          SvgPicture.asset(success, color:successColor),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Success!', style: headline2(successColor)),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              'Your funds have been deposited into your bank account'),
                          const SizedBox(
                            height: 30,
                          ),
                            AppButton(
                              textColor: white,
                              onPressed: () {},
                              label: 'See Transaction details'),
                          const SizedBox(
                            height: 10,
                          ),
                          AppButton(
                              textColor: white,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder:(ccontext)=>MyWalletScreen()));
                              },
                              label: 'Exit'),
                              SizedBox(height:20)
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 20),
                          SvgPicture.asset(svgerror),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Error!', style: headline2(errorColor)),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              'The balance is too low on your Mastercard 986******, Please use another payment method to continue'),
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(
                              textColor: white,
                              onPressed: () {},
                              label: 'See Transaction details'),
                          const SizedBox(
                            height: 10,
                          ),
                          AppButton(
                              textColor: white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              label: 'Exit')
                        ],
                      )),
          );
        });
  }
}
