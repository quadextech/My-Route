import 'package:flutter/material.dart';
import 'package:myroute/flows/my%20wallet/views/transaction_details.dart';
import 'package:myroute/flows/my%20wallet/widgets/transaction_widget.dart';

import '../../../constants/app_color.dart';
import '../../../constants/textstyle.dart';
import '../../registration/Reg_global_File/back_button.dart';

class MyTransactionsScreen extends StatefulWidget {
  const MyTransactionsScreen({super.key});

  @override
  State<MyTransactionsScreen> createState() => _MyTransactionsScreenState();
}

class _MyTransactionsScreenState extends State<MyTransactionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('My Transactions', style: body2(black, TextDecoration.none)),
      ),
      body: Column(
        children: [
          Container(
            height: 65,
            color: grey5,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TabBar(
                controller: _tabController,
                labelColor: white,
                unselectedLabelColor: grey3,
                indicator: BoxDecoration(
                    color: _tabController.index == 0
                        ? black
                        : _tabController.index == 1
                            ? warningColor
                            : successColor,
                    borderRadius: BorderRadius.circular(30)),
                tabs: const [
                  Tab(
                    child: Text(
                      'All',
                    ),
                  ),
                  Tab(
                    child: Text('Top Ups'),
                  ),
                  Tab(child: Text('Withdrawals',style:TextStyle(fontSize:11))),
                ],
                onTap: (index) {
                  setState(() {});
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TabBarView(controller: _tabController, children: [
                Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransactionDetails()));
                        },
                        child: AllTransactions()),
                  ],
                ),
                Center(child: Text('Nothing to see here')),
                Center(child: Text('Nothing to see here'))
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class AllTransactions extends StatelessWidget {
  const AllTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox( width: MediaQuery.of(context).size.width*0.8,
      child: const TransactionWidget(
        status: 'Processed',
        type: 'withdrawal',
      ),
    );
  }
}