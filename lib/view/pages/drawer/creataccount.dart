import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane/business/acount_ddeatails/creatacount/bankaccount_cubit.dart';
import 'package:plane/cons.dart';
import 'package:plane/model/shared/cachhelper.dart';

class CreatBank extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  TextEditingController addmoneycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BankaccountCubit(),
        child: BlocConsumer<BankaccountCubit, BankaccountState>(
            listener: (context, state) {
              if (state is BankaccountSuccess) {
                print("booking done");
                cachHelper.Savedataa(
                    key: "account", value: state.addcashing!.id)
                    .then((value) {

                  accountId =state.addcashing?.id;
                  print("$accountId"+"llllllllllllll");

                });
              }


            },
            builder: (context, state) {
              BankaccountCubit cubit = BankaccountCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepOrangeAccent,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Container(
                      height: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "         Hello in our bank      ",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "     you need to create an account ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Icon(Icons.arrow_downward)
                            ],
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text(
                                                  "add money to be able to book tickets"),
                                              content: Text(
                                                  "The money you want to add. :"),
                                              actions: [
                                                TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty)
                                                      return "can not be empty";
                                                    return null;
                                                  },
                                                  onFieldSubmitted: (value) {
                                                    print("the value you add is :" + value);
                                                  },
                                                  controller:
                                                      addmoneycontroller,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      horizontal: 20.0,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        15.0,
                                                      ),
                                                    ),
                                                    label: const Text(
                                                      'add money',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                ConditionalBuilder(
                                                  condition: state is! BankaccountLoading,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                      width: double.infinity,
                                                      color: Colors
                                                          .deepOrangeAccent,
                                                      child: MaterialButton(
                                                        onPressed: () {

                                                          print(
                                                              "ading tokeeeeeeeeeen");
                                                          if (formkey
                                                              .currentState!
                                                              .validate()) {

                                                            cubit.bankaccount(
                                                              cash:
                                                                  addmoneycontroller
                                                                      .text,
                                                            );
                                                            Navigator.pop( context);
                                                            AlertDialog(
                                                              title:
                                                                  Text("Done"),
                                                            );
                                                          }
                                                        },
                                                        child: Text(
                                                          'Done',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  fallback:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                      color: Colors.amber,
                                                    ));
                                                  },
                                                ),
                                              ],
                                            ));
                                  },
                                  child: Text("Create one"),
                                  color: Colors.deepOrangeAccent,
                                ),
                                Divider(
                                  color: Colors.black12,
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
