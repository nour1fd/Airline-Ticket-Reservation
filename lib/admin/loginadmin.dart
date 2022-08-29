import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane/admin/bussiness/loginadmin/loginadmin_cubit.dart';
import 'package:plane/admin/homeadmin.dart';
import 'package:plane/business/log_up/login_cubit.dart';
import 'package:plane/model/shared/cachhelper.dart';

class LogInAdmin extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  var user_nameController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginadminCubit(),
        child: BlocConsumer<LoginadminCubit,LoginadminState>(
          listener: (context,state){
            // if(state is LoginadminSuccess) {
            //   if (state.loginModel.status == true) {
            //     print(state.loginModel.data!.user_name);
            //
            //     cachHelper.Savedataa(key: "token",
            //         value: state.loginModel.data!.token).then((value){
            //       Navigator.push
            //         (context, MaterialPageRoute(
            //           builder: (BuildContext context)=>HomeScreen()));
            //     }
            //     );
            //
            //     // Fluttertoast.showToast(
            //     //     msg: state.loginModel.message.toString(),
            //     //     // msg: "This is Center Short Toast",
            //     //     toastLength: Toast.LENGTH_LONG,
            //     //     gravity: ToastGravity.BOTTOM,
            //     //     timeInSecForIosWeb: 5,
            //     //     backgroundColor: Colors.red,
            //     //     textColor: Colors.white,
            //     //     fontSize: 16.0
            //     // );
            //   }
            //   else {
            //     print(state.loginModel.message.toString());
            //     // Fluttertoast.showToast(
            //     //     msg:state.loginModel.message.toString(),
            //     //     toastLength: Toast.LENGTH_LONG,
            //     //     gravity: ToastGravity.BOTTOM,
            //     //     timeInSecForIosWeb: 5,
            //     //     backgroundColor: Colors.red,
            //     //     textColor: Colors.white,
            //     //     fontSize: 16.0
            //     // );
            //   }
            // }
          },
          builder: (context,state) {
            LoginadminCubit cubit =LoginadminCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor:Colors.white,
                elevation: 0.0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Form(
                      key:formkey ,
                      child: Column (
                          children: [
                            Row(
                              children: [
                                Expanded(child: Image.asset("assets/images/alder.png",height: 250,)),
                                Text("Login as Admin ",
                                  style:
                                  Theme.of(context).textTheme.headline5!.copyWith(color:
                                  Colors.black,
                                    fontWeight: FontWeight.w500,
                                  )  ,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0,),
//username
                            TextFormField(
                              validator: (value) {
                                if(value!.isEmpty)
                                  return "can not be empty";
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              controller: user_nameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                label: const Text(
                                  'Username',
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20.0,
                            ),

                            //password
                            TextFormField(
                              validator: (value) {
                                if(value.toString().isEmpty){
                                  return 'code not can Empty';
                                }
                                return null;
                              },
                              controller: passwordController,
                              decoration: InputDecoration(
                                isDense: false,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                label: const Text(
                                  'code',
                                ),
                              ),
                              onFieldSubmitted: (value) {
                                if(formkey.currentState!.validate()){
                                  cubit.userloginAdmin(
                                      user_name: user_nameController.text,
                                      admin_code: passwordController.text);
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),

                            const SizedBox(
                              height: 25.0,
                            ),

                            // Container(color: Colors.indigo,
                            //   width: 390.0,
                            //   child:MaterialButton(onPressed: () {
                            //     if(formkey.currentState!.validate()){
                            //       Navigator.push(context, MaterialPageRoute(
                            //           builder: (BuildContext context)=>HomePage()));
                            //
                            //       print(passwordController.text);
                            //       print(user_nameController.text);
                            //     }
                            //   },
                            //       child: const Text("login",style:  TextStyle(
                            //         color: Colors.white
                            //       ),),
                            //
                            //     color: Colors.indigo,
                            //
                            //   ),
                            // ),
                            // هااااااااااااام

                            ConditionalBuilder(
                              condition: state is!LoginadminLoading,
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  color: Colors.deepOrangeAccent,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if(formkey.currentState!.validate()){
                                        cubit.userloginAdmin(
                                            user_name: user_nameController.text,
                                            admin_code: passwordController.text);
                                        Navigator.push
                                          (context, MaterialPageRoute(
                                            builder: (BuildContext context)=>HomeScreen()));
                                      }
                                    },

                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              fallback: (BuildContext context) {
                                return  Center(child:
                                CircularProgressIndicator(color:Colors.amber ,)
                                );
                              },

                            ),

                          ]
                      ),
                    )
                ),
              ),

            );
          },
        )

    );
  }
}