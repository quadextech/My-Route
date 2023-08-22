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
  bool isDueDate = true;

  @override
  Widget build(BuildContext context) {
    bool isPotrait = Orientation.portrait == MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('Rent out MyCar', style: body1(black, TextDecoration.none),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9, bottom: 15, top: 40),
              child: Text('Select Car to rent out',style: headline2(black,),),
            ),

            isEmpty ?
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Center(child: Text('Nothing to see here'),),) : Expanded(
              child: GridView.count(
                  crossAxisCount: isPotrait ? 2 : 3,
                  children: List.generate(4, (index) => Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isRented ? primaryColor : black
                          ),
                          color: grey1,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 100,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(blackcar),
                            Text('2010 Range Rover Sport', style: body3(black, TextDecoration.none),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 70),
                              child: Row(
                                children: [
                                  SvgPicture.asset(license),
                                  Text('Reg no: AE45IKEH'),
                                ],
                              ),
                            ),
                            
                            isDueDate ? Text('Due date: 19th Feb, 2027', style: body3(Colors.red, TextDecoration.none)) : Text(''),

                            RentOutMyCarButton(),
                          ],
                        ),
                      ),
                    ),
                  ),),
              ),
            ),
          ],
        ),
      ),

    );
  }
}


class RentOutMyCarButton extends StatelessWidget {
  const RentOutMyCarButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(primaryColor),
      ),
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PublishCarForRent(),
            ));
      },
      child: Container(
        height: size.height*0.042,
        width: size.width*0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isRented ? primaryColor : black,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isRented ? Text('Car rented to Michael', style: body2(primaryColor, TextDecoration.none),) : const Text('Rent out MyCar'),
              Icon(Icons.arrow_forward, size: 25, color: isRented ? primaryColor : black,),
            ],
          ),
        ),
      ),
    );
  }
}