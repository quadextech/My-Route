import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/app_image.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, this.results});
  final results;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: grey3,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(results.image),
                  ),
                  Text('${results.name} '),
                ],
              ),
              Text('${results.carName} ${results.plateNo}'),
              Text('MyRoute: ${results.route}'),
              Row(
                children: [
                  Icon(Icons.history),
                  Text('${results.time}'),
                  Icon(
                    Icons.person,
                  ),
                  Text('${results.seats} seats availale')
                ],
              )
            ],
          ),
          Column(children: [
          Row(children: [SvgPicture.asset(monie), Text('${results.price}')],),
          SvgPicture.asset(carandkey)
          ],)
        ],
      ),
    );
  }
}
