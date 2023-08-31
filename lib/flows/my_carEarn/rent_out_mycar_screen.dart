import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../registration/Reg_global_File/App_button.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'Publish_car_for_rent.dart';

bool isRented = true;

class RentOutMyCar extends StatefulWidget {
  const RentOutMyCar({Key? key}) : super(key: key);

  @override
  State<RentOutMyCar> createState() => _RentOutMyCarState();
}

class _RentOutMyCarState extends State<RentOutMyCar> {
  bool isEmpty = false;
  bool isDueDate = false;
  bool isRented = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isPotrait = Orientation.portrait == MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text(
          'Rent out MyCar',
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
                'Select Car to rent out',
                style: body3(
                  black,TextDecoration.none
                ),
              ),
            ),
            isEmpty
                ? ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    //height: MediaQuery.of(context).size.height * 0.7,
                    //padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Center(
                      child: Text('Nothing to see here'),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isPotrait ? 2 : 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 3,
                            childAspectRatio: 0.8,
                            mainAxisExtent: size.height * 0.35),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: index==3?successColor:Colors.transparent),
                                  color: grey5,
                                  borderRadius: BorderRadius.circular(10)),
                              // height: 120,
                              // width: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(blackcar),
                                    Text(
                                      '2010 Range Rover Sport',
                                      textAlign: TextAlign.center,
                                      style: body3(black, TextDecoration.none),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(license),
                                        Text(
                                          'Reg no: AE45IKEH',
                                          style:
                                              body4(black, TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                    if (index == 3)
                                      Text('Due date: 19th Feb, 2027',textAlign: TextAlign.center,
                                          style: body4(
                                              Colors.red, TextDecoration.none)),
                                    RentOutMyCarButton(color: index==3? successColor:black, text: index ==3? 'Car Rented to Michael':'Rent out MyCar'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}

class RentOutMyCarButton extends StatelessWidget {
  final String text;
  final Color color;
  const RentOutMyCarButton({Key? key, required this.text, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(primaryColor),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PublishCarForRent(),
            ));
      },
      child: Container(
        height: size.height * 0.042, 
        width: size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: color,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style:TextStyle( fontFamily: "Avenir", fontSize:10, color:color, )
              ),
              Icon(
                Icons.arrow_forward,
                size: 18,
                color: color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
