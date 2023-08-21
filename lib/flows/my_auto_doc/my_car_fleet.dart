import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../registration/Reg_global_File/App_button.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'auto_doc_setting/auto_doc_settings.dart';


bool isDue = false;

class MyCarFleet extends StatefulWidget {
  const MyCarFleet({Key? key}) : super(key: key);

  @override
  State<MyCarFleet> createState() => _MyCarFleetState();
}

class _MyCarFleetState extends State<MyCarFleet> {

  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
   bool isPotrait = Orientation.portrait == MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('My AutoDoc', style: body1(black, TextDecoration.none),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9, bottom: 15),
              child: Text('My Car Fleet',style: headline2(black,),),
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
                        color: isDue ? Colors.red : black
                      ),
                      color: grey,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: 100,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(blackcar),
                          Text('2010 Range Rover Sport', style: body3(black, TextDecoration.none),),
                          Row(
                            children: [
                              SvgPicture.asset(license),
                              Text('Reg no: AE45IKEH'),
                            ],
                          ),

                          CarFleetButton(),
                        ],
                      ),
                    ),
                  ),
                ))
            ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: AppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyCarFleet(),
                          ));
                    },
                    label: "Register a new Car",),
              ),
    ],
            ),
      ),

    );
  }
}


class CarFleetButton extends StatelessWidget {
  const CarFleetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AutoDocSettings(),
            ));
      },
      child: Container(
        height: 30,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isDue ? Colors.red : black,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              isDue ? const Text('Doc renewal due', style: TextStyle(color: Colors.red),) : const Text('AutoDoc settings'),
              Icon(Icons.arrow_forward, size: 15, color: isDue ? Colors.red : black,),
            ],
          ),
        ),
      ),
    );
  }
}