import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:plane/business/acount_ddeatails/gtx_info.dart';

import 'package:plane/business/booking/confirm/confirm_cubit.dart';
import 'package:plane/cons.dart';

class Confirming extends StatefulWidget {
  const Confirming({Key? key}) : super(key: key);

  @override
  State<Confirming> createState() => _ConfirmingState();
}

class _ConfirmingState extends State<Confirming> {
  final ViewAccount viewAccount = Get.put(ViewAccount());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ConfirmCubit(),
      child: BlocConsumer<ConfirmCubit,ConfirmState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          ConfirmCubit cubit =ConfirmCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white24,
              title: Text("reservation confirmation",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Tickets(s) cost:     ",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$costing",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    color: Colors.black12,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Tickets(s) id:          ",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$idTicket",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    color: Colors.black12,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 150.0,
                    color: Colors.deepOrangeAccent,
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Ticket booked "),
                            actions: [
                              MaterialButton(onPressed:() {
                                // viewAccount
                                //     .showaccountinfo();
                                Navigator.pop(context);
                                setState(() {
                                  confirm="yes";

                                });

                              },
                                child: Text("Done"),)
                            ],
                          ),);
                        cubit.confirmbookticket();
                        print("$accountId");
                        viewAccount
                            .showaccountinfo();
                        print("confirming book id done and your balance change");
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
