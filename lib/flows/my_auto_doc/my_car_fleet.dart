import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/flows/my_auto_doc/pay_renewal_fee.dart';
import 'package:myroute/flows/registration/Car_Registration/views/car_details_reg.dart';

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
    final size = MediaQuery.of(context).size;
    bool isPotrait = Orientation.portrait == MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text(
          'My AutoDoc',
          style: body3(black, TextDecoration.none),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 9, bottom: 15),
                child: Text(
                  'My Car Fleet',
                  style: body3(black, TextDecoration.none),
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
                  : ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: size.width * 0.9, maxHeight: 450),
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 230, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: isDue
                                          ? Colors.red
                                          : Colors.transparent),
                                  color: grey5,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(blackcar),
                                    Text(
                                      '2010 Range Rover Sport',
                                      style: body3(black, TextDecoration.none),
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      children: [
                                        SvgPicture.asset(license),
                                        Text('Reg no: AE45IKEH',
                                            style: body4(
                                                black, TextDecoration.none)),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    CarFleetButton(state: index==3,
                                        color: index == 3
                                            ? Colors.red
                                            : Colors.black,
                                        text: index == 3
                                            ? 'Doc renewal due'
                                            : 'AutoDoc Settings'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: AppButton(
                  textColor: white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetailsReg(),
                        ));
                  },
                  label: "Register a new Car",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarFleetButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool state;
  const CarFleetButton({Key? key, required this.text, required this.color, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => state?PayRenewalFee(): const AutoDocSettings() ,
            ));
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: color),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(text, style: body4(color, TextDecoration.none)),
              Icon(Icons.arrow_forward, size: 15, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
