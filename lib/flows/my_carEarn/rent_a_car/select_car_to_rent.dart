import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';
import '../../../constants/textstyle.dart';
import '../../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../../my_auto_doc/gridViewButton.dart';
import '../../registration/Reg_global_File/App_button.dart';
import '../../registration/Reg_global_File/back_button.dart';

class SelectCarToRent extends StatefulWidget {
  const SelectCarToRent({Key? key}) : super(key: key);

  @override
  State<SelectCarToRent> createState() => _SelectCarToRentState();
}

class _SelectCarToRentState extends State<SelectCarToRent> {

  void RentalSuccess(){
    showModalBottomSheet(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))

    ), context: context, builder: (context){
      Size size = MediaQuery.of(context).size;
      return CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset( success, color: primaryColor,)),
            SizedBox(height: 15,),
            Center(child: Text('Success!', style: headline1(primaryColor),)),
            SizedBox(height: 20,),


            SizedBox(
              width: size.width * 0.95,
              child: Center(
                child: Text("Your Car rental application has been sent to Mr Dangote.",
                  style: body3(black, TextDecoration.none),
                  softWrap: true, maxLines: 1000, overflow: TextOverflow.visible,),
              ),),
            SizedBox(height: 10,),
            SizedBox(
              width: size.width * 0.95,
              child: Center(
                child: Text("You will be notified if it's successful.",
                  style: body3(black, TextDecoration.none),
                  softWrap: true, maxLines: 1000, overflow: TextOverflow.visible,),
              ),),
            SizedBox(height: 30,),
            AppButton(
                onPressed: (){
                  Navigator.pop(context);
                }, label: 'Exit'),

          ],
        ),
      );
    });
  }


  void ApplyToRent() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return CustomPopUpContainer(
            height: MediaQuery.of(context).size.height * 0.9,
            sizedheight: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: SvgPicture.asset(mdicarsports)),
                    SizedBox(
                      width: 10,
                    ),
                    Center(child: Text('2010 Range Rover rental conditions', style: TextStyle(fontSize: 18))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.supervised_user_circle),
                )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mr Dangote',
                      style: headline1(black),
                    ),
                    Text(
                      '.',
                    ),
                    SvgPicture.asset(star),
                    SvgPicture.asset(star),
                    SvgPicture.asset(star),
                    SvgPicture.asset(star),
                    SvgPicture.asset(star),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Car owner' ),
                    Text(' . '),
                    Text('09077886545'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(accesstime),
                    Text('3 months. Due on 19th Feb, 2027'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(search),
                    Text('Car monitoring enabled'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(money),
                    SizedBox(width: 10,),
                    Text('60% on every passenger  .  N500.00 per day if idle'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1.3,
                              color: primaryColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(svgcall),
                        )),
                    SizedBox(width: 20,),
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1.3,
                              color: primaryColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(message),
                        )),
                  ],
                ),
                SizedBox(height: 20,),
                AppButton(
                    onPressed: () {
                      Navigator.pop(context);
                      RentalSuccess();
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> AutoSaveDetails()));
                    },
                    label: 'Apply to rent'),

              ],
            ),
          );
        });
  }

  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isPotrait = Orientation.portrait == MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text(
          'Rent a Car',
          style: body1(black, TextDecoration.none),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9, bottom: 15, top: 40),
              child: Text(
                'Select Car to rent',
                style: headline2(
                  black,
                ),
              ),
            ),
            isEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Center(
                      child: Text('Nothing to see here'),
                    ),
                  )
                : Expanded(
                    child: GridView.count(
                      crossAxisCount: isPotrait ? 2 : 3,
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: grey,
                                borderRadius: BorderRadius.circular(10)),
                            // height: size.height*0.2,
                            // width: size.height*0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    blackcar,
                                    height: isPotrait
                                        ? size.height * 0.08
                                        : size.height * 0.3,
                                  ),
                                  Text(
                                    '2010 Range Rover Sport',
                                    style: isPotrait
                                        ? body3(black, TextDecoration.none)
                                        : body2(black, TextDecoration.none),
                                  ),
                                  Row(
                                    children: [
                                      Center(
                                          child: Icon(
                                        Icons.supervised_user_circle_rounded,
                                        size: isPotrait ? 25 : 40,
                                      )),

                                      Expanded(
                                          child: Center(
                                              child: Text(
                                        'Car owner: Mr Dangote',
                                        style: isPotrait
                                            ? body4(black, TextDecoration.none)
                                            : body3(black, TextDecoration.none),
                                      ))),
                                      // SizedBox(
                                      //   width: size.width * 0.2,
                                      //   child: Text('Car owner: Mr Dangote',
                                      //     style: body3(black, TextDecoration.none),
                                      //     softWrap: true,
                                      //     maxLines: 1000, overflow: TextOverflow.visible,),),
                                    ],
                                  ),
                                  Expanded(
                                    child: GridViewButton(
                                      onPressed: () {
                                        ApplyToRent();
                                      },
                                      border: Border.all(
                                          //color: isRented ? primaryColor : black,
                                          ),
                                      text: 'Rent Car',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}