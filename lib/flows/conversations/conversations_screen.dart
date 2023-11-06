import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import '../../constants/textstyle.dart';
import '../PassengerBookingFlow/view/select_car_preferences/models/BorderButton.dart';
import '../trips_history/models/navigationitems.dart';
import 'models/messages_Package.dart';
import 'models/phonecalls_package.dart';

class Conversations extends StatefulWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {

  List conversationPages = [
    const MessagesBox(),
    const PhonecallBox(),
  ];

  List<String> textName = [
    'Messages',
    'Phone calls',
  ];

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 1,
        title: Padding(padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text('Conversations', style: body1(black, TextDecoration.none),)),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BorderButton(
            backgroundColor: white,
            color: black,
            onTap: () {
              Navigator.of(context).pop();
            },
            icons: Icons.arrow_back,
            size: 20,
          ),
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 1,
            child: Container(
              height:60,
              color: white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(conversationPages.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: MyRidesContainer(
                        textName: _currentIndex == index ? textName[index] : textName[index],
                        color: _currentIndex == index
                            ? black
                            : null,
                        textColor: _currentIndex == index ? white : hintColor,
                      ),
                    );
                  })),
            ),
          ),

          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height * 0.6),
            child: Stack(children: [
              PageView.builder(
                  itemCount: conversationPages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return conversationPages[index];

                  }),
            ]),
          ),
        ],
      ),
    );
  }
}