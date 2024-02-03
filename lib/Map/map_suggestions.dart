import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../constants/app_color.dart';
import '../main.dart';
import 'map_shared_prefs.dart';
import 'mapbox_requests.dart';


class MapSuggestions extends ConsumerStatefulWidget {

  final AnimatedMapController animatedMapController;



  const MapSuggestions({super.key, required this.animatedMapController,});

  @override
  ConsumerState<MapSuggestions> createState() => _MapSuggestionsState();
}

class _MapSuggestionsState extends ConsumerState<MapSuggestions> with TickerProviderStateMixin{


  final TextEditingController searchController = TextEditingController();
  late int mapBoxId;
  LatLng? desLocation;
  late LatLng currentlatlng;



  void onChange(){
    ref.read(mapRequestsProvider).SuggestLocationName(searchController.text).then((value) {

    });
  }

  @override
  void initState() {
    searchController.addListener(() {
     onChange();
    });
   currentlatlng = getLatLngFromSharedPrefs();

  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mapRequestsProvider);

    return Scaffold(
      body: Consumer(
        builder: (_, ref, __) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                    border: const Border(bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black), left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black)),
                    color: white,
                    borderRadius: const BorderRadius.all(Radius.circular(30),
                    ),),
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.search)),
                      hintText: 'Search for location',
                      contentPadding: EdgeInsets.only(left: 30),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30),
                        ),
                      ),),
                    controller: searchController,
                  ),
                ),
              ),

              Expanded(child: ListView.builder(
                itemCount: state.suggestions.length,
                  itemBuilder: (context, index){
                  return ListTile(
                    onTap: () async{
                      final mapBoxId = state.suggestions[index]['mapbox_id'];
                      ref.read(mapRequestsProvider).SearchedLocationName(mapBoxId).then((value) async {
                        final desLocation = LatLng(value.latitude!, value.longitude!);
                        setState(() {
                          prefs.setDouble("deslatitude", value.latitude!);
                          prefs.setDouble('deslongitude', value.longitude!);
                        });

                       widget.animatedMapController.centerOnPoint(desLocation);
                        Navigator.pop(context);
                      });
                      },
                    title: Text(state.suggestions[index]['name']),
                  );
                  }))
            ],
          );
        }
      ),
    );
  }
}