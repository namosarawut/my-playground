// // ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_element, avoid_print, unnecessary_new, unused_local_variable, non_constant_identifier_names, prefer_final_fields, must_be_immutable, unnecessary_brace_in_string_interps, unnecessary_string_interpolations
// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
//
//
// class CustomerMap extends StatefulWidget {
//   String? car_id;
//   String? user_id;
//   CustomerMap({Key? key, required this.car_id, required this.user_id})
//       : super(key: key);
//
//   @override
//   State<CustomerMap> createState() => _CustomerMapState();
// }
//
// class _CustomerMapState extends State<CustomerMap> {
//   String? car_id;
//   List dataList = [];
//   GoogleMapController? mapController;
//   Position? driverLocation;
//   String? user_id;
//   List location_car = [];
//   String lati_driver = '0';
//   String longti_driver = '0';
//   List<Marker> _makers = [];
//   String? data_distance1;
//   late BitmapDescriptor mapMaker;
//   double? distance;
//   bool visibleTabBottom = false;
//   calculateDistance() {
//     var p = 0.017453292519943295;
//     var c = cos;
//     var a = 0.5 -
//         c((13.7321834828 - double.parse(lati_driver.toString())) * p) / 2 +
//         c(13.7321834828 * p) *
//             c(double.parse(lati_driver.toString()) * p) *
//             (1 -
//                 c((double.parse(lati_driver.toString()) - 13.7321834828) * p)) /
//             2;
//     setState(() {
//       distance = 12742 * asin(sqrt(a));
//       print("distance: ${distance}");
//     });
//   }
//
//   void setCustomMaker() async {
//     mapMaker = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(), "assets/images/bus.png");
//   }
//
//   List<Marker> listMap = [
//   ];
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     setState(() {
//       _makers.add(
//         Marker(
//             markerId: MarkerId('id-1'),
//             icon: mapMaker,
//             position: lati_driver == ''
//                 ? LatLng(0, 0)
//                 : LatLng(double.parse(lati_driver.toString()),
//                 double.parse(longti_driver.toString())),
//             infoWindow: InfoWindow(
//               title: 'คนขับ',
//             )),
//       );
//     });
//   }
//
//   Future get_user_id() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       user_id = preferences.getString('user_id');
//     });
//     get_data_user();
//   }
//
//   Future select_car_driver() async {
//     var url = Uri.parse('${ipconnect}/get_car/select_car_driver.php');
//     var response = await http.post(url, body: {
//       "car_id": widget.car_id.toString(),
//       "user_id": widget.user_id.toString(),
//     });
//   }
//
//   Future get_data_user() async {
//     final response = await http
//         .get(Uri.parse("$ipconnect/login/get_data_user.php?user_id=$user_id"));
//     var data = json.decode(response.body);
//
//     setState(() {
//       dataList = data;
//       car_id = dataList[0]['car_id'];
//     });
//     get_location_car();
//   }
//
//   Future get_location_car() async {
//     final response = await http.get(
//         Uri.parse("$ipconnect/get_car/get_location_car.php?car_id=${car_id}"));
//     var data = json.decode(response.body);
//     setState(() {
//       location_car = data;
//     });
//     lati_driver = location_car[0]['lo_driver_lati'];
//     longti_driver = location_car[0]['lo_driver_longti'];
//     print("location lati car : ${lati_driver}");
//     print("location longti car : ${longti_driver}");
//   }
//
//   Future<Position?> _getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         return Future.error(
//             'Location permissions are permanently denied, we cannot request permissions.');
//       }
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     driverLocation = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.best);
//     return driverLocation;
//   }
//
//   getDataRealTime() async {
//     Timer.periodic(new Duration(seconds: 5), (timer) async {
//       get_location_car();
//       _getLocation();
//       // timer.cancel(); //ถ้าต้องการให้หยุดทำงาน
//     });
//   }
//   var MapData = [{
//     "lat" :  13.7321834828,
//     "long" : 100.487415791,
//     "title": "คณะ ครุศาสตร์"
//   }];
//   addmap(){
//     for(var i = 0; i<MapData.length;i++){
//       var lat = double.parse("${MapData[i]['lat']}");
//       var long = double.parse("${MapData[i]['long']}");
//       var title = MapData[i]['title'].toString();
//       listMap.add(Marker(
//         onTap: (){
//           setState(() {
//             visibleTabBottom = true;
//           });
//         },
//         markerId: MarkerId('1'),
//         position: LatLng(lat,long),
//         infoWindow: InfoWindow(title: title, snippet: 'ระยะห่างจากรถ '),
//       ));
//     }
//
//
//   }
//
//   @override
//   void initState() {
//     get_user_id();
//     select_car_driver();
//     getDataRealTime();
//     calculateDistance();
//     _makers.addAll(list);
//     setCustomMaker();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _getLocation(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             return Stack(
//               children: [
//                 GoogleMap(
//                     markers: _makers.toSet(),
//                     zoomControlsEnabled: false,
//                     mapType: MapType.normal,
//                     myLocationButtonEnabled: false,
//                     onMapCreated: _onMapCreated,
//                     myLocationEnabled: true,
//                     initialCameraPosition: CameraPosition(
//                         zoom: 17,
//                         target: LatLng(driverLocation!.latitude,
//                             driverLocation!.longitude))),
//                 Positioned(
//                   left: 20,
//                   top: 75,
//                   child: Container(
//                     width: 355,
//                     height: 60,
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             colors: [
//                               Color.fromARGB(255, 133, 88, 148),
//                               Color.fromARGB(255, 167, 110, 186)
//                             ]),
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Icon(
//                             Icons.arrow_back_ios_new,
//                             color: Colors.white,
//                             size: 25,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 25,
//                         ),
//                         Text(
//                           "รถคันที่ ${widget.car_id} ",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(
//                                 builder: (BuildContext context) {
//                                   return ProFileScreen();
//                                 }));
//                           },
//                           child: Icon(
//                             Icons.account_circle,
//                             color: Colors.white,
//                             size: 35,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: false,
//                   child: Positioned(
//                     left: 20,
//                     top: MediaQuery.of(context).size.height * 0.8,
//                     child: Container(
//                         width: 355,
//                         height: MediaQuery.of(context).size.height * 0.8,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [Colors.white, Colors.black]),
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Column(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "ชื่อสถานที่ : ",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text("ระยะทาง ${distance}"),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return Stack(
//               children: [
//                 Positioned(
//                   left: 20,
//                   top: 80,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       width: 45,
//                       height: 45,
//                       decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 1,
//                               offset: Offset(3, 3), // Shadow position
//                             ),
//                           ],
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8)),
//                       child: Icon(Icons.arrow_back_ios_new),
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           mapController?.animateCamera(CameraUpdate.newLatLngZoom(
//               LatLng(driverLocation!.latitude, driverLocation!.longitude), 20));
//         },
//         child: Icon(Icons.near_me),
//       ),
//     );
//   }
// }
