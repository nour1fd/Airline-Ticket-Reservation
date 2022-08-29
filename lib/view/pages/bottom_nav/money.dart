import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:plane/business/acount_ddeatails/addcash_cubit.dart';
import 'package:plane/business/acount_ddeatails/gtx_info.dart';
import 'package:plane/view/pages/bottom_nav/tile.dart';
import '../../../cons.dart';

class Money extends StatefulWidget {
  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  var formkey = GlobalKey<FormState>();
  var addmoneycontroller = TextEditingController();
  final ViewAccount viewAccount = Get.put(ViewAccount());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddcashCubit(),
        child: BlocConsumer<AddcashCubit, AddcashState>(
            listener: (context, state) {},
            builder: (context, state) {
              AddcashCubit cubit = AddcashCubit.get(context);
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
                            "         Hello in our bank ",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Text(
                            "Your Balance is :",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Expanded(
                            child: Obx(() {
                              if (viewAccount.isloding.value)
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              else
                                return ListView.builder(
                                  itemCount: viewAccount.account.length,
                                  itemBuilder: (context, index) {
                                    return Tile(viewAccount.account[index],);
                                  },
                                );
                            }),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                StatefulBuilder(
                                    builder: (context, StateSetter setState) {
                                  return MaterialButton(
                                    onPressed: () {
                                      viewAccount
                                        .showaccountinfo();
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text("Adding money"),
                                                content: Text(
                                                    "The money you want to add :"),
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
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                                    condition: state
                                                        is! AddcashLoading,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        width: double.infinity,
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            showDialog(context: context,
                                                                builder: (context) => AlertDialog(
                                                                  title: Text("The funds were added successfully"),
                                                                  actions: [
                                                                    MaterialButton(onPressed:() {
                                                                      viewAccount
                                                                          .showaccountinfo();
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: Text("Done"),)
                                                                  ],
                                                                ),);
                                                            viewAccount
                                                                .showaccountinfo();
                                                            print("token : "+"$token");
                                                            print("ading money done");
                                                            if (formkey
                                                                .currentState!
                                                                .validate()) {
                                                              cubit.addcash(
                                                                cash:(int.parse(addmoneycontroller.text))
                                                              );
                                                              print("ading money done");
                                                              print("addmoneycontroller:  "+addmoneycontroller.text);
                                                            }
                                                          },
                                                          child: Text(
                                                            'Done',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                    child: Text("Add money"),
                                    color: Colors.deepOrangeAccent,
                                  );
                                }),
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
