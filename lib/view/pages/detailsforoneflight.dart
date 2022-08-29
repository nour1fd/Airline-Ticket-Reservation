import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane/business/booking/booking_cubit.dart';
import 'package:plane/cons.dart';
import 'package:plane/model/flight_info/flightmodel.dart';
import 'package:plane/view/pages/finalpage.dart';
import 'package:plane/model/shared/cachhelper.dart';

class DetailsForFlightUser extends StatefulWidget {
  final FlightModel flightModel;
  DetailsForFlightUser({required this.flightModel});
  @override
  State<DetailsForFlightUser> createState() => _DetailsForFlightUserState();
}

class _DetailsForFlightUserState extends State<DetailsForFlightUser> {
  var note = "not confirm";
  var typeofticket = "Vip";
  var formkey = GlobalKey<FormState>();
  var countryController = TextEditingController();

  var cityController = TextEditingController();

  var capacityController = TextEditingController();

  var arrivals_toController = TextEditingController();

  var departures_fromController = TextEditingController();

  var date_timeController = TextEditingController();

  var admin_idController = TextEditingController();
  var coubtOfTicketController = TextEditingController();
  var idController = TextEditingController();
  var idflight, unit;
  dynamic seats, vip, bus, eco,change;

  @override
  Widget build(BuildContext context) {
    countryController.text = widget.flightModel.country;
    cityController.text = widget.flightModel.city;
    capacityController.text = widget.flightModel.capacity.toString();
    arrivals_toController.text = widget.flightModel.arrivalsTo;
    departures_fromController.text = widget.flightModel.departuresFrom;
    date_timeController.text = widget.flightModel.departuresFrom;
    admin_idController.text = widget.flightModel.adminId.toString();
    idController.text = widget.flightModel.id.toString();
    idflight = idController.text;
    unit = coubtOfTicketController.text;
    seats = (int.parse(capacityController.text));
    vip = seats * 20 / 100;
    bus = seats * 30 / 100;
    eco = seats * 50 / 100;

    return BlocProvider(
        create: (context) => BookingCubit(),
        child: BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state is BookingSuccess) {
              print("booking done");
              print(state.book.ticketDetails.cost);
              cachHelper.Savedataa(key: "book", value: state.book.message)
                  .then((value) {
                costing = state.book.ticketDetails.cost;
                idTicket = state.book.ticketDetails.id;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Confirming()));
              });
            }
          },
          builder: (context, state) {
            BookingCubit cubit = BookingCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white24,
                title: Text("Details of the trip",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: idController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(),
                            label: const Text(
                              'id country',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: cityController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(),
                            label: const Text(
                              'city',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: countryController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(),
                            label: const Text(
                              'country',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: capacityController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(),
                            label: const Text(
                              'capacity',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: arrivals_toController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(),
                            label: const Text(
                              'arrivals_to',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: departures_fromController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(),
                            label: const Text(
                              'departures_from',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: date_timeController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(),
                            label: const Text(
                              'date_time',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.deepOrangeAccent,
                          child: MaterialButton(
                            onPressed: () {
                              idflight = idController.text;
                              print(seats);
                              print(vip);
                              print(eco);
                              print(bus);
                              print("llllllllllllllllllllll");
                              setState(() {
                                idflights = idflight;
                              });

                              print("$accountId");
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (context, StateSetter setState) {
                                      return AlertDialog(
                                        title:
                                            Text("please fill in the fields "),
                                        content: TextField(
                                          controller: coubtOfTicketController,
                                          decoration: InputDecoration(
                                            hintText: "Number of seats ",
                                          ),
                                        ),
                                        actions: [
                                          Column(
                                            children: [
                                              ListTile(
                                                title: Text("VIP"),
                                                leading: Radio<String>(
                                                  value: "vip",
                                                  groupValue: typeofticket,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      typeofticket = value!;
                                                      print("VIP");
                                                    });
                                                  },
                                                ),
                                              ),
                                              ListTile(
                                                title: Text("Business"),
                                                leading: Radio<String>(
                                                  value: "business",
                                                  groupValue: typeofticket,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      typeofticket = value!;
                                                      print("Business");
                                                    });
                                                  },
                                                ),
                                              ),
                                              ListTile(
                                                title: Text("Economy"),
                                                leading: Radio<String>(
                                                  value: "economy",
                                                  groupValue: typeofticket,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      typeofticket = value!;
                                                      print("Economy");
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          ConditionalBuilder(
                                            condition: state is! BookingLoading,
                                            builder: (BuildContext context) {
                                              return Container(
                                                width: double.infinity,
                                                color: Colors.deepOrangeAccent,
                                                child: MaterialButton(
                                                  onPressed: () {
                                                    print(typeofticket);
                                                    print("jjjjjjjjjjjj");
                                                    if (formkey.currentState!
                                                        .validate()) {
                                                      cubit.bookticket(
                                                          units:
                                                              coubtOfTicketController
                                                                  .text,
                                                          type: typeofticket,
                                                          cost: 100,
                                                          user_id: "$userId",
                                                          flight_id: idflight);
                                                      if (typeofticket ==
                                                          "vip") {
                                                        vip--;
                                                      } else if (typeofticket ==
                                                          "eco") {
                                                        eco--;
                                                      } else {
                                                        bus--;
                                                      }
                                                      print(seats);
                                                      print(vip);
                                                      print(eco);
                                                      print(bus);
                                                    }
                                                  },
                                                  child: Text(
                                                    'Next',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            fallback: (BuildContext context) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: Colors.amber,
                                              ));
                                            },
                                          )
                                        ],
                                      );
                                    });
                                  });
                            },
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
//                                 ConditionalBuilder(
//                                    condition: state is!BookingLoading,
//                                    builder: (BuildContext context) {
//
//                                      return Container(
//                                        width: double.infinity,
//                                        color: Colors.deepOrangeAccent,
//                                        child: MaterialButton(
//                                          onPressed: () {
//                                            if(formkey.currentState!.validate()){
//                                              cubit.bookticket(
//                                                  units: coubtOfTicketController.text,
//                                                  type: "vip",
//                                                  cost:100.toString(),
//                                                  flight_id:6.toString(),
//                                                  user_id:20.toString()
//                                              );
//                                              print("vvvvvvvvvvvvvvvvvv");
//                                              // Navigator.push
//                                              //   (context, MaterialPageRoute(
//                                              //     builder: (BuildContext context)=>Confirming()));
//                                            }
//                                          },
//                                          child: Text(
//                                            'Next',
//                                            style: TextStyle(
//                                              color: Colors.white,
//                                            ),
//                                          ),
//                                        ),
//                                      );
//                                    },
//                                    fallback: (BuildContext context) {
//                                      return  Center(child:
//                                      CircularProgressIndicator(color:Colors.amber ,)
//                                      );
//                                    },
//
//                                  )                                      ],

//    return BlocProvider(
//         create: (context)=>BookingCubit(),
//       child: BlocConsumer<BookingCubit,BookingState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           BookingCubit cubit=BookingCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white24,
//               title: Text("Details of the trip",style:
//               Theme.of(context).textTheme.headline5!.copyWith(color:
//               Colors.black,
//                 fontWeight: FontWeight.bold,
//               )),
//             ),
//             body: SingleChildScrollView(
//               child: Form(
//                 key:formkey ,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 20,),
//                       TextFormField(
//
//                         readOnly: true,
//                         validator: (value) {
//                           if(value!.isEmpty)
//                             return "can not be empty";
//                           return null;
//                         },
//                         onFieldSubmitted: (value) {
//                           print(value);
//                         },
//                         controller: idController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20.0,
//                           ),
//                           border: OutlineInputBorder(
//                           ),
//                           label: const Text(
//                             'id country',
//                             style: TextStyle(fontWeight: FontWeight.w900,
//                                 fontSize: 20.0,
//                                 color: Colors.deepOrangeAccent),
//
//                           ),
//                         ),
//
//                       ),
//                       SizedBox(height: 20,),
//                       TextFormField(readOnly: true,
//                         validator: (value) {
//                           if(value!.isEmpty)
//                             return "can not be empty";
//                           return null;
//                         },
//                         onFieldSubmitted: (value) {
//                           print(value);
//                         },
//                         controller: cityController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20.0,
//                           ),
//                           border: OutlineInputBorder(
//
//                           ),
//                           label: const Text(
//                             'city',  style: TextStyle(fontWeight: FontWeight.w900,
//                               fontSize: 20.0,
//                               color: Colors.deepOrangeAccent),
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       TextFormField(readOnly: true,
//                         validator: (value) {
//                           if(value!.isEmpty)
//                             return "can not be empty";
//                           return null;
//                         },
//                         onFieldSubmitted: (value) {
//                           print(value);
//                         },
//                         controller: countryController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20.0,
//                           ),
//                           border: OutlineInputBorder(
//                           ),
//                           label: const Text(
//                             'country',  style: TextStyle(fontWeight: FontWeight.w900,
//                               fontSize: 20.0,
//                               color: Colors.deepOrangeAccent),
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       TextFormField(readOnly: true,
//                         validator: (value) {
//                           if(value!.isEmpty)
//                             return "can not be empty";
//                           return null;
//                         },
//                         onFieldSubmitted: (value) {
//                           print(value);
//                         },
//                         controller: capacityController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20.0,
//                           ),
//                           border: OutlineInputBorder(
//
//                           ),
//                           label: const Text(
//                             'capacity',  style: TextStyle(fontWeight: FontWeight.w900,
//                               fontSize: 20.0,
//                               color: Colors.deepOrangeAccent),
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       TextFormField(readOnly: true,
//                         validator: (value) {
//                           if(value!.isEmpty)
//                             return "can not be empty";
//                           return null;
//                         },
//                         onFieldSubmitted: (value) {
//                           print(value);
//                         },
//                         controller: arrivals_toController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20.0,
//                           ),
//                           border: OutlineInputBorder(
//
//                           ),
//                           label: const Text(
//                             'arrivals_to',  style: TextStyle(fontWeight: FontWeight.w900,
//                               fontSize: 20.0,
//                               color: Colors.deepOrangeAccent),
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       TextFormField(readOnly: true,
//                         validator: (value) {
//                           if(value!.isEmpty)
//                             return "can not be empty";
//                           return null;
//                         },
//                         onFieldSubmitted: (value) {
//                           print(value);
//                         },
//                         controller: departures_fromController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20.0,
//                           ),
//                           border: OutlineInputBorder(
//
//                           ),
//                           label: const Text(
//                             'departures_from',  style: TextStyle(fontWeight: FontWeight.w900,
//                               fontSize: 20.0,
//                               color: Colors.deepOrangeAccent),
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       TextFormField(readOnly: true,
//                         validator: (value) {
//                           if(value!.isEmpty)
//                             return "can not be empty";
//                           return null;
//                         },
//                         onFieldSubmitted: (value) {
//                           print(value);
//                         },
//                         controller: date_timeController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20.0,
//                           ),
//                           border: OutlineInputBorder(
//
//                           ),
//                           label: const Text(
//                             'date_time',  style: TextStyle(fontWeight: FontWeight.w900,
//                               fontSize: 20.0,
//                               color: Colors.deepOrangeAccent),
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       Container(
//                         width: double.infinity,
//                         color: Colors.deepOrangeAccent,
//                         child:
//                         MaterialButton(
//                           onPressed: () {
//                             showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return StatefulBuilder(builder:(context,StateSetter setState){
//                                     return AlertDialog(
//                                       title: Text("please fill in the fields "),
//                                       content:TextField(
//                                         decoration: InputDecoration(
//                                             hintText: "Number of seats "
//                                         ),
//                                       ),
//                                       actions: [
//                                         Column(
//                                           children: [
//                                             ListTile(
//                                               title: Text("VIP"),
//                                               leading: Radio<String>(
//                                                 value:"VIP",
//                                                 groupValue: typeofticket,
//                                                 onChanged: (value) {
//                                                   setState(() {
//                                                     typeofticket=value!;
//                                                     print("VIP");
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             ListTile(
//                                               title: Text("Business"),
//                                               leading: Radio<String>(
//                                                 value:"Business",
//                                                 groupValue: typeofticket,
//                                                 onChanged: (value) {
//                                                   setState(() {
//                                                     typeofticket=value!;
//                                                     print("Business");
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             ListTile(
//                                               title: Text("Economy"),
//                                               leading: Radio<String>(
//                                                 value:"Economy",
//                                                 groupValue: typeofticket,
//                                                 onChanged: (value) {
//                                                   setState(() {
//                                                     typeofticket=value!;
//                                                     print("Economy");
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         ConditionalBuilder(
//                                           condition: state is!BookingLoading,
//                                           builder: (BuildContext context) {
//
//                                             return Container(
//                                               width: double.infinity,
//                                               color: Colors.deepOrangeAccent,
//                                               child: MaterialButton(
//                                                 onPressed: () {
//                                                   if(formkey.currentState!.validate()){
//                                                     cubit.book(
//                                                         user_name: user_nameController.text,
//                                                         password: passwordController.text);
//
//                                                     // Navigator.push
//                                                     //   (context, MaterialPageRoute(
//                                                     //     builder: (BuildContext context)=>HomePage()));
//                                                   }
//                                                 },
//
//                                                 child: Text(
//                                                   'LOGIN',
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                           fallback: (BuildContext context) {
//                                             return  Center(child:
//                                             CircularProgressIndicator(color:Colors.amber ,)
//                                             );
//                                           },
//
//                                         )                                      ],
//
//                                     );
//
//                                   } );
//                                 }
//                             );
//                           },
//                           child: Text(
//                             'Book Now',
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       )
//     );
